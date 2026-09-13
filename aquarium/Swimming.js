// Independent, fixed-step, three-dimensional steering. No filmed routes and no
// filmed projection tracks. A seed exists for repeatable QA; normal launches
// seed from the clock. Positions, speeds and scene clearance are centimetres.
function clamp(x, a, b) { return Math.max(a, Math.min(b, x)); }
function add(a, b) { return [a[0]+b[0], a[1]+b[1], a[2]+b[2]]; }
function sub(a, b) { return [a[0]-b[0], a[1]-b[1], a[2]-b[2]]; }
function mul(a, s) { return [a[0]*s, a[1]*s, a[2]*s]; }
function dot(a, b) { return a[0]*b[0]+a[1]*b[1]+a[2]*b[2]; }
function length(a) { return Math.sqrt(dot(a, a)); }
function unit(a) { return mul(a, 1/Math.max(1e-8, length(a))); }
function mix(a, b, t) { return add(mul(a, 1-t), mul(b, t)); }
function limitPitch(v) {
    var p=clamp(Math.asin(clamp(v[1],-1,1)),-.90,.90), yaw=Math.atan2(v[0],v[2]);
    return [Math.sin(yaw)*Math.cos(p),Math.sin(p),Math.cos(yaw)*Math.cos(p)];
}
function randomSource(seed) {
    var s = seed >>> 0;
    return function() { s = (Math.imul(1664525, s)+1013904223) >>> 0; return s/4294967296; };
}

function fieldIndex(field, p) {
    var cell = p.map(function(v, k) { return Math.round((v-field.origin[k])/field.step); });
    if (cell.some(function(v, k) { return v<0 || v>=field.dims[k]; })) return -1;
    return cell[0]+field.dims[0]*(cell[1]+field.dims[1]*cell[2]);
}
function clearance(field, p) {
    var index = fieldIndex(field, p);
    if (index < 0) return 0;
    // Continuous conservative clearance avoids a braking jump at cell borders.
    var x=(p[0]-field.origin[0])/field.step,y=(p[1]-field.origin[1])/field.step,z=(p[2]-field.origin[2])/field.step;
    var ix=Math.floor(x),iy=Math.floor(y),iz=Math.floor(z),dx=x-ix,dy=y-iy,dz=z-iz;
    if(ix<0||iy<0||iz<0||ix+1>=field.dims[0]||iy+1>=field.dims[1]||iz+1>=field.dims[2])return 0;
    // Interpolate blocked cells as zero clearance. Checking only the nearest
    // cell made clearance jump from several cm to zero at a half-cell border,
    // where small fish could repeatedly brake against an invisible boundary.
    if(!field.navigableDistances)field.navigableDistances=field.distances.map(function(value,i){return field.reachable.charAt(i)==='1'?value:0;});
    var nx=field.dims[0],plane=nx*field.dims[1],base=ix+nx*iy+plane*iz,v=field.navigableDistances;
    var front=(v[base]*(1-dx)+v[base+1]*dx)*(1-dy)+(v[base+nx]*(1-dx)+v[base+nx+1]*dx)*dy;
    var back=(v[base+plane]*(1-dx)+v[base+plane+1]*dx)*(1-dy)+(v[base+plane+nx]*(1-dx)+v[base+plane+nx+1]*dx)*dy;
    return Math.max(0,front*(1-dz)+back*dz-field.errorBound);
}
function wallClearance(world, p) {
    var value = Infinity;
    for (var k=0; k<3; k++) value = Math.min(value, p[k]-world.lo[k], world.hi[k]-p[k]);
    var rear=world.field.backdropPlane;
    if(rear)value=Math.min(value,dot(rear.normal,p)-rear.offset);
    // Reserve turning room at these boundaries too, especially for the eel:
    // fitting lengthwise into the near-camera wedge is not enough to turn out.
    if(world.field.enforceVisibleFrame)value=Math.min(value,viewClearance(world,p));
    return value;
}
function viewClearance(world,p) {
    // In a bounded tank these planes also constrain every full-body sample.
    var value=Infinity;
    var planes=world.field.viewPlanes||[];
    for(var i=0;i<planes.length;i++)value=Math.min(value,dot(planes[i].normal,p)-planes[i].offset);
    return value;
}
function space(world, p) {
    return Math.min(clearance(world.field,p),wallClearance(world,p));
}
function valid(world, p, radius) { return space(world, p)>radius; }
function gradient(world, p) {
    var d = world.field.step;
    return unit([0, 1, 2].map(function(k) {
        var a = p.slice(), b = p.slice(); a[k]+=d; b[k]-=d;
        return space(world, a)-space(world, b);
    }));
}
function clearSegment(world,a,b,radius) {
    var distance=length(sub(b,a)), steps=Math.max(1,Math.ceil(distance/4));
    for(var i=0;i<=steps;i++) if(!valid(world,mix(a,b,i/steps),radius)) return false;
    return true;
}
function gridPoint(world,index) {
    var g=world.grid;
    if(g.points[index])return g.points[index];
    var x=index%g.dims[0], yz=Math.floor(index/g.dims[0]);
    return [g.origin[0]+x*10,g.origin[1]+(yz%g.dims[1])*10,g.origin[2]+Math.floor(yz/g.dims[1])*10];
}
function nearestNode(world,p,radius,wallRadius) {
    var g=world.grid, c=p.map(function(v,k){return Math.round((v-g.origin[k])/10);});
    var best=-1, score=Infinity;
    for(var z=-2;z<=2;z++)for(var y=-2;y<=2;y++)for(var x=-2;x<=2;x++) {
        var a=c[0]+x,b=c[1]+y,d=c[2]+z;
        if(a<0||b<0||d<0||a>=g.dims[0]||b>=g.dims[1]||d>=g.dims[2])continue;
        var index=a+g.dims[0]*(b+g.dims[1]*d);
        if(g.room[index]<radius+1||(wallRadius&&wallClearance(world,gridPoint(world,index))<wallRadius+1))continue;
        var point=gridPoint(world,index),dist=length(sub(point,p));
        if(dist<score&&clearSegment(world,p,point,radius)){score=dist;best=index;}
    }
    return best;
}
function push(heap,item) {
    var i=heap.length;heap.push(item);
    while(i>0) {var parent=(i-1)>>1;if(heap[parent].score<=item.score)break;heap[i]=heap[parent];i=parent;}
    heap[i]=item;
}
function pop(heap) {
    var first=heap[0],last=heap.pop();if(!heap.length)return first;
    var i=0;
    while(2*i+1<heap.length) {
        var child=2*i+1;
        if(child+1<heap.length&&heap[child+1].score<heap[child].score)child++;
        if(heap[child].score>=last.score)break;
        heap[i]=heap[child];i=child;
    }
    heap[i]=last;return first;
}
function route(world,fish,destination) {
    var radius=fish.pathRadius||fish.radius,wallRadius=turningRoom(fish);
    if(clearSegment(world,fish.p,destination,radius+2))return [destination];
    // A fish braking near a hard frame edge may have less than the route's
    // extra 1 cm buffer. Let it leave using its actual full-body radius, then
    // join the buffered graph. Otherwise every replan can fail at its origin.
    var start=nearestNode(world,fish.p,radius+(world.field.enforceVisibleFrame?0:1),wallRadius),end=nearestNode(world,destination,radius+1,wallRadius);
    if(start<0||end<0)return null;
    var g=world.grid, costs={},parents={},closed={},heap=[];
    costs[start]=0;push(heap,{index:start,score:length(sub(gridPoint(world,start),destination))});
    var expanded=0;
    while(heap.length&&expanded<12000) {
        var current=pop(heap).index;if(closed[current])continue;closed[current]=true;expanded++;
        if(current===end) {
            var raw=[destination],n=end;
            while(n!==start){raw.unshift(gridPoint(world,n));n=parents[n];}
            raw.unshift(gridPoint(world,start));
            var result=[],anchor=fish.p,at=0;
            while(at<raw.length) {
                var far=at;
                for(var j=at;j<raw.length;j++) {
                    if(clearSegment(world,anchor,raw[j],radius+2))far=j;
                    else break;
                }
                result.push(raw[far]);anchor=raw[far];at=far+1;
            }
            world.routeExpansions+=expanded;return result;
        }
        var p=gridPoint(world,current),ix=current%g.dims[0],iy=Math.floor(current/g.dims[0])%g.dims[1],iz=Math.floor(current/(g.dims[0]*g.dims[1]));
        var next=[ix>0?current-1:-1,ix+1<g.dims[0]?current+1:-1,
                  iy>0?current-g.dims[0]:-1,iy+1<g.dims[1]?current+g.dims[0]:-1,
                  iz>0?current-g.dims[0]*g.dims[1]:-1,iz+1<g.dims[2]?current+g.dims[0]*g.dims[1]:-1];
        for(var k=0;k<next.length;k++) {
            n=next[k];if(n<0||closed[n]||g.room[n]<radius+2||(wallRadius&&wallClearance(world,gridPoint(world,n))<wallRadius+2))continue;
            var cost=costs[current]+10+Math.max(0,12-(g.room[n]-radius))*.2;
            if(costs[n]!==undefined&&cost>=costs[n])continue;
            if(g.edges[Math.min(current,n)*3+(k>>1)]<=radius+1)continue;
            costs[n]=cost;parents[n]=current;
            push(heap,{index:n,score:cost+length(sub(gridPoint(world,n),destination))});
        }
    }
    world.routeExpansions+=expanded;world.failedRoutes++;return null;
}
function mainSwimRegion(world,fish) {
    if(!world.regions)world.regions={};
    var radius=fish.radius,key=String(radius);
    if(world.regions[key])return world.regions[key];
    var g=world.grid,seen={},largest=[];
    // Use the same buffered nodes/edges as the route planner. A point can fit
    // a fish yet belong to a tiny isolated pocket with no route to open water.
    for(var start=0;start<g.points.length;start++) {
        if(seen[start]||g.room[start]<radius+2)continue;
        var queue=[start];seen[start]=true;
        for(var at=0;at<queue.length;at++) {
            var id=queue[at],p=g.points[id],strides=[1,g.dims[0],g.dims[0]*g.dims[1]];
            for(var axis=0;axis<3;axis++)for(var sign=-1;sign<=1;sign+=2) {
                var next=id+sign*strides[axis],point=g.points[next];
                if(!point||Math.abs(point[axis]-p[axis])!==10||seen[next]||g.room[next]<radius+2||
                   g.edges[Math.min(id,next)*3+axis]<=radius+1)continue;
                seen[next]=true;queue.push(next);
            }
        }
        if(queue.length>largest.length)largest=queue;
    }
    var region={};for(var i=0;i<largest.length;i++)region[largest[i]]=true;
    world.regions[key]=region;return region;
}
function connectedWater(world,fish,p) {
    if(!world.field.enforceVisibleFrame||fish.bodyOffsets)return true;
    // A verified narrow passage can lie between the coarse graph's Y layers.
    // Its full corridor is checked before routing; only nearby points with a
    // clear connection to that corridor count as connected during the visit.
    if(fish.passage) {
        var points=fish.passage.points;
        for(var j=1;j<points.length;j++) {
            var segment=sub(points[j],points[j-1]);
            var t=clamp(dot(sub(p,points[j-1]),segment)/dot(segment,segment),0,1);
            var near=add(points[j-1],mul(segment,t));
            if(length(sub(p,near))<8&&clearSegment(world,p,near,fish.radius+1))return true;
        }
    }
    return !!mainSwimRegion(world,fish)[nearestNode(world,p,fish.radius+1)];
}
function reachableFront(world,fish) {
    if(!world.frontWater)world.frontWater={};
    var key=String(fish.radius);
    if(world.frontWater[key])return world.frontWater[key];
    var points=[],front=[],nearest=-Infinity,connected=mainSwimRegion(world,fish),habitats=world.field.habitats;
    for(var i=0;i<world.grid.points.length;i++) {
        var p=world.grid.points[i];
        if(!connected[i]||world.grid.room[i]<=fish.radius+5)continue;
        var within=false;
        for(var name in habitats)if(p.every(function(v,k){return v>=habitats[name].lo[k]&&v<=habitats[name].hi[k];}))within=true;
        if(!within)continue;
        points.push(p);nearest=Math.max(nearest,p[2]);
        if(p.every(function(v,k){return v>=habitats.front.lo[k]&&v<=habitats.front.hi[k];}))front.push(p);
    }
    // Large fins cannot reach the same front box as a clownfish. Prefer the
    // foremost 40 cm of that animal's connected water instead of failing every
    // front choice and quietly choosing another distant destination.
    if(!front.length) {
        // Reserve extra room at the destination for a large fish to finish
        // its turn. The very tip of a reachable neck can fit its centre but
        // puts its forward momentum past the graph's safe return corridor.
        var turning=points.filter(function(p){return space(world,p)>fish.radius+Math.max(8,fish.cruise*.65);});
        if(turning.length)points=turning;
        nearest=-Infinity;for(var j=0;j<points.length;j++)nearest=Math.max(nearest,points[j][2]);
        front=points.filter(function(p){return p[2]>=nearest-40;});
    }
    world.frontWater[key]=front;return front;
}
function target(world, fish) {
    // Habitats overlap. They bias exploration, not fixed paths or swim lanes.
    var choice=world.random(), region=choice<.26?'rear':choice<.66?'reef':choice<.84?'front':'open';
    if(world.field.habitatWeights) {
        var remaining=choice,weights=world.field.habitatWeights;
        for(var name in weights){remaining-=weights[name];if(remaining<0){region=name;break;}}
    }
    var front=region==='front'&&world.field.reachableFrontFallback&&!fish.bodyOffsets?reachableFront(world,fish):null;
    for (var i=0; i<200; i++) {
        var p = [0,1,2].map(function(k) {
            return world.lo[k]+fish.radius+8+world.random()*(world.hi[k]-world.lo[k]-2*fish.radius-16);
        });
        if(front&&front.length) {
            var anchor=front[Math.floor(world.random()*front.length)];
            p=anchor.map(function(v){return v+(world.random()-.5)*8;});
        }
        else if(world.field.habitats && world.field.habitats[region]) {
            var habitat=world.field.habitats[region];
            p=[0,1,2].map(function(k){return habitat.lo[k]+world.random()*(habitat.hi[k]-habitat.lo[k]);});
        }
        else if(region==='rear') {p[0]=-120+world.random()*240;p[1]=30+world.random()*70;p[2]=-132+world.random()*48;}
        else if(region==='reef')p[1]=27+world.random()*78;
        else if(region==='front'){p[1]=30+world.random()*90;p[2]=52+world.random()*25;}
        else p[1]=105+world.random()*42;
        // Destinations remain reachable water. Local steering handles the reef
        // between this destination and the animal; it is not a scripted path.
        if(fish.avoidPocketUntil>world.time&&length(sub(p,fish.avoidPocket))<60)continue;
        if (valid(world, p, (fish.pathRadius||fish.radius)+5) && viewClearance(world,p)>fish.radius+5 && wallClearance(world,p)>turningRoom(fish)+5 && length(sub(p, fish.p))>45 && connectedWater(world,fish,p)) {fish.region=region;return p;}
    }
    return fish.p.slice();
}
function safeSpawn(world,fish) {
    // Random habitat attempts can fail in a narrow visible volume. Never let
    // that failure return an initial point outside the tank/frame.
    var best=null,bestScore=-Infinity;
    for(var i=0;i<world.grid.points.length;i++) {
        if(world.grid.room[i]<=fish.radius+5)continue;
        if(world.field.enforceVisibleFrame&&!fish.bodyOffsets&&!mainSwimRegion(world,fish)[i])continue;
        var p=world.grid.points[i],separation=80;
        for(var j=0;j<world.fish.length;j++)
            separation=Math.min(separation,length(sub(p,world.fish[j].p))-fish.radius-world.fish[j].radius);
        var score=separation+world.random()*12;
        if(score>bestScore){bestScore=score;best=p;}
    }
    if(!best)throw new Error('No fully contained spawn for '+fish.species);
    return best.slice();
}
function create(field, seed, population) {
    var world = {field:field, seed:seed>>>0, random:randomSource(seed), time:0, accumulator:0,
                 lo:field.swimBounds?field.swimBounds.lo:[-158,12,-77],hi:field.swimBounds?field.swimBounds.hi:[158,167,95],
                 fish:[],blockedSteps:0,routeExpansions:0,failedRoutes:0};
    world.grid={origin:field.origin,dims:field.dims.map(function(d){return Math.floor((d-1)/2)+1;}),room:[],points:[],edges:[]};
    var g=world.grid;
    for(var cell=0;cell<g.dims[0]*g.dims[1]*g.dims[2];cell++) {
        g.points.push(gridPoint(world,cell));g.room.push(space(world,g.points[cell]));
    }
    // The reef is static. Cache each edge's clearance once, so a new random
    // destination does not resample thousands of reef segments during a frame.
    var strides=[1,g.dims[0],g.dims[0]*g.dims[1]];
    for(cell=0;cell<g.room.length;cell++)for(var axis=0;axis<3;axis++) {
        var coordinate=Math.floor(cell/strides[axis])%g.dims[axis],room=0;
        if(coordinate+1<g.dims[axis]) {
            var neighbour=cell+strides[axis];room=Math.min(g.room[cell],g.room[neighbour]);
            for(var sample=1;sample<3&&room>0;sample++)room=Math.min(room,space(world,mix(g.points[cell],g.points[neighbour],sample/3)));
        }
        g.edges.push(room);
    }
    population=population||[{species:'clown',radius:7.8,cruise:11},{species:'tang',radius:12,cruise:17},{species:'clown',radius:7.8,cruise:11}];
    var starts = [[-77,103,48],[68,125,-18],[27,62,70]];
    for (var i=0; i<population.length; i++) {
        var spec=population[i],f={id:i,species:spec.species,radius:spec.radius,pathRadius:spec.pathRadius,bodyOffsets:spec.bodyOffsets,
                 p:starts[i]||[0,130,40],direction:unit([i%2?-.8:.8,.10,i%3?-.55:.3]),
                 speed:0,cruise:spec.cruise,phase:world.random()*3,
                 bank:0,mode:'cruise',until:world.random()*5,goalAge:0,choices:0,route:[],routeAt:0,
                 hiddenSeconds:0,reappearances:0,hiddenFor:0};
        if(field.enforceVisibleFrame&&(!valid(world,f.p,f.radius+3)||!connectedWater(world,f,f.p)))f.p=safeSpawn(world,f);
        if (i>2||!valid(world,f.p,f.radius+3)||viewClearance(world,f.p)<f.radius+3) {
            for(var attempt=0;attempt<100;attempt++) {
                f.p=target(world,f);
                if(world.fish.every(function(other){return length(sub(other.p,f.p))>other.radius+f.radius+8;}))break;
            }
        }
        if(f.bodyOffsets) {
            // Initial orientation must clear head and tail as well as the centre.
            f.p=[0,36,54];f.direction=[1,0,0];f.bank=0;
            for(var attempt=0;bodySpace(world,f,f.p,f.direction)<5&&attempt<1000;attempt++) {
                f.p=target(world,f);
                f.direction=limitPitch(unit([world.random()-.5,(world.random()-.5)*.5,world.random()-.5]));
            }
            if(bodySpace(world,f,f.p,f.direction)<5)throw new Error('No clear moray spawn in this navigation field');
            f.steer=f.direction;f.steerUntil=0;
        }
        newDestination(world,f);
        world.fish.push(f);
    }
    return world;
}
function passageRoute(world,fish) {
    if(fish.bodyOffsets||world.time<(fish.nextPassageTime||0)||world.time<(world.passageBusyUntil||0))return null;
    var passages=world.field.passages||[];
    for(var i=0;i<passages.length;i++) {
        var spec=passages[i],points=spec.points;
        if(fish.radius>spec.maxRadius||fish.p[2]>points[1][2]+15||world.random()>spec.chance)continue;
        if(!connectedWater(world,fish,points[0])||!connectedWater(world,fish,points[points.length-1]))continue;
        var clear=true;
        for(var j=1;j<points.length;j++)if(!clearSegment(world,points[j-1],points[j],fish.radius+2))clear=false;
        if(!clear)continue;
        var approach=route(world,fish,points[0]);
        if(!approach)continue;
        world.passageBusyUntil=world.time+60;
        fish.nextPassageTime=world.time+90+world.random()*60;
        fish.passage=spec;fish.region=spec.id;
        return approach.concat(points.slice(1).map(function(p){return p.slice();}));
    }
    return null;
}
function newDestination(world,fish) {
    var contained=world.field.enforceVisibleFrame&&!fish.bodyOffsets;
    if(contained&&world.time<(fish.nextRouteAttempt||0))return;
    if(fish.passage){fish.passage=null;world.passageBusyUntil=world.time+8;}
    var passage=contained?passageRoute(world,fish):null;
    if(passage) {
        fish.route=passage;fish.goal=passage[passage.length-1];fish.routeAt=0;fish.goalAge=0;fish.choices++;
        fish.goalLimit=60;fish.nextRouteAttempt=world.time+.75;return;
    }
    for(var trial=0;trial<8;trial++) {
        var destination=target(world,fish);
        if(contained&&length(sub(destination,fish.p))<30)continue;
        var path=route(world,fish,destination);
        if(path) {
            fish.goal=destination;fish.route=path;fish.routeAt=0;fish.goalAge=0;fish.choices++;
            fish.goalLimit=Math.max(35,length(sub(destination,fish.p))/fish.cruise*3+15);
            fish.nextRouteAttempt=world.time+.75;
            return;
        }
    }
    if(contained) {
        // A failed route must not launch eight more searches on every frame.
        // Keep steering in free water and retry after a short cooldown.
        fish.nextRouteAttempt=world.time+1.5;
        fish.goal=add(fish.p,mul(fish.direction,40));fish.route=[fish.goal];fish.routeAt=0;
        fish.goalAge=0;fish.goalLimit=1.5;
        return;
    }
    fish.goal=fish.p.slice();fish.route=[fish.goal];fish.routeAt=0;fish.goalAge=0;fish.goalLimit=5;
}
function chooseMode(world, fish) {
    var r = world.random();
    fish.mode = r<.15?'hover':r>.91?'burst':'cruise';
    fish.until = world.time + (fish.mode==='hover'?1+world.random()*2.4:
                               fish.mode==='burst'?.6+world.random()*.9:3+world.random()*6);
}
function turnTowards(a, b, maxAngle) {
    var cosine=clamp(dot(a,b),-1,1),angle=Math.acos(cosine);
    if(angle<=maxAngle||angle<1e-6)return b;
    // Rotate in the great-circle plane. A linear blend near 180 degrees
    // barely changed the heading, adding a hesitation before the turn began.
    var tangent=sub(b,mul(a,cosine));
    if(length(tangent)<1e-6) {
        var axis=Math.abs(a[1])<.8?[0,1,0]:[1,0,0];
        tangent=sub(axis,mul(a,dot(a,axis)));
    }
    return unit(add(mul(a,Math.cos(maxAngle)),mul(unit(tangent),Math.sin(maxAngle))));
}
function turningRoom(fish) {
    return fish.bodyOffsets?fish.radius+Math.max(Math.abs(fish.bodyOffsets[0]),Math.abs(fish.bodyOffsets[fish.bodyOffsets.length-1])):0;
}
function turnInWater(a,b,maxAngle) {
    var yawA=Math.atan2(a[0],a[2]),yawB=Math.atan2(b[0],b[2]);
    var pitchA=Math.asin(clamp(a[1],-1,1)),pitchB=Math.asin(clamp(b[1],-1,1));
    pitchB=clamp(pitchB,-.9,.9);
    var yaw=(yawB-yawA+3*Math.PI)%(2*Math.PI)-Math.PI,pitch=pitchB-pitchA;
    // Interpolate within the allowed pitch band. Clipping a great-circle
    // turn at its top/bottom could discard almost all rotation for seconds.
    // The maximum cosine along this path bounds its spherical arc length.
    var maxCos=pitchA*pitchB<=0?1:Math.cos(Math.min(Math.abs(pitchA),Math.abs(pitchB)));
    var distance=Math.sqrt(pitch*pitch+yaw*yaw*maxCos*maxCos);
    var fraction=Math.min(1,maxAngle/Math.max(1e-8,distance));
    var p=pitchA+pitch*fraction,y=yawA+yaw*fraction;
    return [Math.sin(y)*Math.cos(p),Math.sin(p),Math.cos(y)*Math.cos(p)];
}
function bodySpace(world,fish,p,direction) {
    if(!fish.bodyOffsets)return space(world,p)-fish.radius;
    // Reserve enough room to turn at the glass; a straight long body can fit
    // parallel to a wall yet have no way to steer away without bending its axis.
    // Reef clearance still uses the narrow animated envelope along the body.
    var room=wallClearance(world,p)-turningRoom(fish);
    for(var j=0;j<fish.bodyOffsets.length;j++)
        room=Math.min(room,space(world,add(p,mul(direction,fish.bodyOffsets[j])))-fish.radius);
    return room;
}
function longBodyForecast(world,f,desired) {
    var p=f.p,d=f.direction,room=Infinity;
    // Test the turning tail as well as the nose throughout the next three
    // seconds. A clear endpoint alone does not make a safe turn for an eel.
    for(var j=0;j<6;j++) {
        var next=limitPitch(turnTowards(d,desired,.45*.5*clamp(f.speed/6,world.field.enforceVisibleFrame?.55:0,1)));
        p=add(p,mul(unit(add(d,next)),f.speed*.5));d=next;
        room=Math.min(room,bodySpace(world,f,p,d));
    }
    return room;
}
function beginRetreat(world,f) {
    if(world.field.enforceVisibleFrame&&f.trail&&f.trail.length>20) {
        var distance=0;
        for(var h=f.trail.length-1;h>0&&distance<40;h--)distance+=length(sub(f.trail[h].p,f.trail[h-1].p));
        if(distance>6) {
            f.retreatRequested=true;f.retreatPending=f.speed>.05;
            f.avoidPocket=f.p.slice();f.avoidPocketUntil=world.time+35;
            f.recoveries=(f.recoveries||0)+1;f.stalledTime=0;
            if(!f.retreatPending)startTrailRetreat(f);
            return true;
        }
    }
    var retreat=0;
    for(var cm=1;cm<=36;cm++) {
        if(bodySpace(world,f,add(f.p,mul(f.direction,-cm)),f.direction)<.65)break;
        retreat=cm;
    }
    if(retreat<3)return false;
    var brake=world.field.enforceVisibleFrame?f.speed/(f.cruise*1.3):0;
    f.retreatUntil=world.time+brake+retreat/4+(world.field.enforceVisibleFrame?.8:0);
    f.retreatPending=brake>.005;
    f.recoveries=(f.recoveries||0)+1;f.stalledTime=0;
    if(!world.field.enforceVisibleFrame)f.speed=0;
    return true;
}
function rememberTrail(f) {
    if(!f.trail)f.trail=[];
    f.trail.push({p:f.p.slice(),d:f.direction.slice()});
    if(f.trail.length>2400)f.trail.shift();
}
function startTrailRetreat(f) {
    var distance=0,at=f.trail.length-1;
    while(at>0&&distance<40){distance+=length(sub(f.trail[at].p,f.trail[at-1].p));at--;}
    f.retreatTrack=f.trail.slice(at).reverse();f.trail=f.trail.slice(0,at+1);
    f.retreatRemaining=distance;f.retreatIndex=0;f.retreatRequested=false;
}
function stepTrailRetreat(world,f,dt) {
    f.travelSign=-1;f.mode='retreat';
    // Leave braking margin for discrete trail samples, then ease through the
    // final millimetre instead of clipping the residual reverse speed.
    var desiredSpeed=Math.min(4,f.retreatRemaining*3,Math.sqrt(Math.max(0,2*2*f.retreatRemaining)));
    f.speed+=clamp(desiredSpeed-f.speed,-4*dt,4*dt);
    var budget=f.speed*dt,turnBudget=.45*dt;
    while(f.retreatIndex<f.retreatTrack.length&&budget>1e-7) {
        var target=f.retreatTrack[f.retreatIndex],dist=length(sub(target.p,f.p));
        var fraction=dist<1e-8?1:Math.min(1,budget/dist);
        var direction=unit(mix(f.direction,target.d,fraction));
        // Limit reverse corner rotation as well as translation. Trail samples
        // preserve the exact full-body poses checked during forward swimming.
        var angle=Math.acos(clamp(dot(direction,f.direction),-1,1));
        if(angle>turnBudget) {fraction*=turnBudget/angle;direction=unit(mix(f.direction,target.d,fraction));}
        var next=mix(f.p,target.p,fraction);
        if(bodySpace(world,f,next,direction)<=.6)break;
        turnBudget=Math.max(0,turnBudget-Math.acos(clamp(dot(f.direction,direction),-1,1)));
        f.p=next;f.direction=direction;
        var moved=dist*fraction;budget-=moved;f.retreatRemaining=Math.max(0,f.retreatRemaining-moved);
        if(fraction>=.999999)f.retreatIndex++;else break;
    }
    if(f.retreatIndex>=f.retreatTrack.length||(f.retreatRemaining<.001&&f.speed<.05)) {
        f.retreatTrack=null;f.retreatUntil=0;f.speed=0;f.steerUntil=0;
        f.mode='cruise';f.until=world.time+8;newDestination(world,f);
    }
    longBodyPhase(world,f,dt,-1);trackHidden(world,f,dt);
}
function longBodyPhase(world,f,dt,sign) {
    var rate=sign*(.20+.8*f.speed/f.cruise);
    if(world.field.enforceVisibleFrame) {
        if(f.phaseRate===undefined)f.phaseRate=rate;
        f.phaseRate+=(rate-f.phaseRate)*(1-Math.exp(-dt*3));
        rate=f.phaseRate;
    }
    f.phase+=dt*rate;
}
function stepLongBody(world,f,dt) {
    f.travelSign=1;
    if(f.retreatPending) {
        // Reach zero forward speed before backing out, instead of changing
        // from a forward swim to reverse translation in a single frame.
        f.mode='retreat';f.speed=Math.max(0,f.speed-f.cruise*1.3*dt);
        var coast=add(f.p,mul(f.direction,f.speed*dt));
        if(bodySpace(world,f,coast,f.direction)>.6){f.p=coast;if(f.retreatRequested)rememberTrail(f);}
        else {f.speed=0;world.blockedSteps++;}
        if(f.speed<.05){f.speed=0;f.retreatPending=false;if(f.retreatRequested)startTrailRetreat(f);}
        longBodyPhase(world,f,dt,1);trackHidden(world,f,dt);return;
    }
    if(f.retreatTrack){stepTrailRetreat(world,f,dt);return;}
    if(f.retreatUntil>world.time) {
        // A long body can enter a pocket that has no safe forward pivot.
        // Back out along the checked body axis before choosing a fresh route.
        f.travelSign=-1;f.mode='retreat';
        var backingSpeed=world.field.enforceVisibleFrame?4*clamp((f.retreatUntil-world.time)/.8,0,1):4;
        f.speed+=clamp(backingSpeed-f.speed,-5*dt,5*dt);
        var back=add(f.p,mul(f.direction,-f.speed*dt));
        if(bodySpace(world,f,back,f.direction)>.6)f.p=back;
        else {f.speed=0;f.retreatUntil=0;world.blockedSteps++;}
        longBodyPhase(world,f,dt,-1);
        trackHidden(world,f,dt);
        return;
    }
    if(f.mode==='retreat') {
        f.speed=0;f.stalledTime=0;f.steerUntil=0;
        chooseMode(world,f);newDestination(world,f);
    }
    f.goalAge+=dt;
    if(world.time>=f.until)chooseMode(world,f);
    if(length(sub(f.goal,f.p))<16||f.goalAge>f.goalLimit)newDestination(world,f);
    while(f.routeAt<f.route.length-1&&length(sub(f.route[f.routeAt],f.p))<18)f.routeAt++;
    var desired=limitPitch(unit(sub(f.route[f.routeAt]||f.goal,f.p)));
    if(f.avoidPocketUntil>world.time) {
        var away=sub(f.p,f.avoidPocket),distance=length(away);
        if(distance<65)desired=limitPitch(unit(add(desired,mul(unit(away),(65-distance)/65*2))));
    }
    if(world.time>=f.steerUntil) {
        var candidates=[desired,limitPitch(gradient(world,f.p))],best=-Infinity;
        for(var yaw=-3;yaw<=3;yaw++)for(var pitch=-1;pitch<=1;pitch++) {
            var a=Math.atan2(f.direction[0],f.direction[2])+yaw*.9;
            var b=clamp(Math.asin(f.direction[1])+pitch*.65,-.9,.9);
            candidates.push([Math.sin(a)*Math.cos(b),Math.sin(b),Math.cos(a)*Math.cos(b)]);
        }
        for(var c=0;c<candidates.length;c++) {
            var d=candidates[c],room=longBodyForecast(world,f,d);
            var score=Math.min(8,room)*8+dot(d,desired)*16+dot(d,f.direction)*3;
            if(score>best){best=score;f.steer=d;f.forwardRoom=room;}
        }
        f.steerUntil=world.time+.15;
    }
    if(bodySpace(world,f,f.p,f.direction)<3.5&&f.forwardRoom<2&&beginRetreat(world,f)) {
        stepLongBody(world,f,dt);return;
    }
    // A stopped eel must still be able to pivot out of a corner. Every pivot
    // is checked against its entire swept body before it is accepted.
    var direction=limitPitch(turnTowards(f.direction,f.steer,.45*dt*clamp(f.speed/6,world.field.enforceVisibleFrame?.55:0,1)));
    var wanted=f.cruise*(f.mode==='hover'?.035:f.mode==='burst'?1.45:1);
    wanted*=clamp((f.forwardRoom+1)/6,.12,1);
    wanted*=.35+.65*Math.max(0,dot(direction,f.steer));
    f.speed+=clamp(wanted-f.speed,-f.cruise*2.5*dt,f.cruise*.5*dt);
    var next=add(f.p,mul(direction,f.speed*dt));
    if(bodySpace(world,f,next,direction)>.6) {f.p=next;f.direction=direction;if(world.field.enforceVisibleFrame)rememberTrail(f);}
    else {
        f.speed=0;f.steerUntil=0;world.blockedSteps++;
        if(bodySpace(world,f,f.p,direction)>.6)f.direction=direction;
    }
    f.stalledTime=f.speed<.5&&f.mode!=='hover'?(f.stalledTime||0)+dt:0;
    if(f.stalledTime>1.5)beginRetreat(world,f);
    f.bank=0;
    longBodyPhase(world,f,dt,1);
    trackHidden(world,f,dt);
}
function trackHidden(world,f,dt) {
    var index=fieldIndex(world.field,f.p),hidden=world.field.occlusionDepth&&index>=0&&world.field.occlusionDepth[index]>f.radius+5;
    if(hidden){f.hiddenSeconds+=dt;f.hiddenFor+=dt;}
    else{if(f.hiddenFor>.75)f.reappearances++;f.hiddenFor=0;}
}
function compactForecast(world,f,desired,trialSpeed) {
    var p=f.p,d=f.direction,speed=f.speed,room=Infinity,endRoom=0,smooth=f.smoothSteer||f.direction;
    var acceleration=f.acceleration||0,interval=.1;
    var turnRate=f.mode==='burst'||f.recoverUntil>world.time?1.15:.85;
    for(var i=0;i<28;i++) {
        smooth=turnInWater(smooth,desired,1.8*interval);
        d=turnInWater(d,smooth,turnRate*interval);
        var wanted=trialSpeed*(.25+.75*Math.max(0,dot(d,smooth)));
        var targetAcceleration=clamp((wanted-speed)*2,-f.cruise*1.3,f.cruise*.65);
        acceleration+=clamp(targetAcceleration-acceleration,-f.cruise*3*interval,f.cruise*3*interval);
        speed=clamp(speed+acceleration*interval,0,f.cruise*1.8);
        p=add(p,mul(d,speed*interval));
        endRoom=space(world,p)-f.radius;room=Math.min(room,endRoom);
    }
    // Keep local obstacle avoidance in the same connected water as its route.
    // Otherwise a safe-looking arc can leave the route through a narrow neck
    // and enter a pocket whose roomy endpoint has no buffered way back out.
    var g=world.grid,c=p.map(function(v,k){return Math.round((v-g.origin[k])/10);});
    var index=c[0]+g.dims[0]*(c[1]+g.dims[1]*c[2]),region=mainSwimRegion(world,f);
    var connected=!!region[index]&&clearSegment(world,p,g.points[index],f.radius+1);
    if(!connected)connected=connectedWater(world,f,p);
    return {room:room,endRoom:endRoom,connected:connected};
}
function escapePoint(world,f) {
    var best=null,score=-Infinity;
    for(var i=0;i<world.grid.points.length;i++) {
        var p=world.grid.points[i],distance=length(sub(p,f.p)),room=world.grid.room[i]-f.radius;
        if(distance<6||distance>60||room<2||Math.abs(p[1]-f.p[1])/distance>Math.sin(.8)||!mainSwimRegion(world,f)[i])continue;
        // An open endpoint is insufficient: a straight escape can graze a
        // rock halfway there and leave the fish creeping along its surface.
        var corridor=Infinity,steps=Math.ceil(distance/2);
        for(var j=0;j<=steps;j++)corridor=Math.min(corridor,space(world,mix(f.p,p,j/steps))-f.radius);
        if(corridor<.3)continue;
        var value=Math.min(20,room)-distance*.25+Math.min(6,corridor)*8;
        if(value>score){best=p;score=value;}
    }
    return best?best.slice():add(f.p,mul(limitPitch(gradient(world,f.p)),20));
}
function stepContainedFish(world,f,dt) {
    f.goalAge+=dt;
    if(world.time>=f.until)chooseMode(world,f);
    // Begin the escape before braking becomes a near-stop. Waiting until
    // 12% cruise left too little momentum for a smooth complete U-turn.
    f.lowSpeedTime=f.speed<f.cruise*.25&&f.mode!=='hover'?(f.lowSpeedTime||0)+dt:0;
    if(f.lowSpeedTime>.65&&!(f.recoverUntil>world.time)) {
        // Commit to one inward pivot. Re-scoring both sides of a tight turn
        // every 160 ms could alternate steering forever while nearly stopped.
        f.recoverTarget=escapePoint(world,f);f.recoverOrigin=f.p.slice();f.recoverUntil=world.time+7;
        f.steerUntil=0;f.lowSpeedTime=0;
    }
    if(f.recoverUntil>world.time&&(
       (length(sub(f.p,f.recoverOrigin))>10&&space(world,f.p)>f.radius+5)||
       (length(sub(f.p,f.recoverTarget))<4&&connectedWater(world,f,f.p)))) {
        f.recoverUntil=0;f.lowSpeedTime=0;f.nextRouteAttempt=0;newDestination(world,f);
    }
    if(length(sub(f.goal,f.p))<Math.max(18,f.speed*1.4)||f.goalAge>f.goalLimit)newDestination(world,f);
    while(f.routeAt<f.route.length-1&&
          length(sub(f.route[f.routeAt],f.p))<Math.max(16,f.speed*1.6)&&
          clearSegment(world,f.p,f.route[f.routeAt+1],f.radius+2))f.routeAt++;
    var desired=limitPitch(unit(sub(f.route[f.routeAt]||f.goal,f.p)));
    // Separation gently biases a route; it must not cancel every escape turn.
    for(var n=0;n<world.fish.length;n++)if(world.fish[n]!==f) {
        var other=world.fish[n],delta=sub(f.p,other.p);
        if(other.bodyOffsets) {
            var along=clamp(dot(delta,other.direction),other.bodyOffsets[0],other.bodyOffsets[other.bodyOffsets.length-1]);
            delta=sub(delta,mul(other.direction,along));
        }
        var distance=length(delta),comfort=f.radius+other.radius+9;
        if(distance<comfort)desired=unit(add(desired,mul(unit(delta),(comfort-distance)/comfort*.7)));
    }
    var cruiseSpeed=f.cruise*(f.mode==='burst'?1.8:1);
    // Plan a reachable next speed. Testing a stopped fish immediately at full
    // cruise made every escape arc look blocked, so it would never start a turn.
    // Near rest, a tiny initial acceleration makes an escape pivot feasible.
    // Once moving, forecast the larger cruise acceleration early enough to brake.
    var restart=clamp(f.speed/(f.cruise*.2),.2,1);
    var trialSpeed=Math.max(f.speed,Math.min(cruiseSpeed,f.speed+f.cruise*.3*restart));
    var safetyRoom=Math.min(1.3,Math.max(.02,(space(world,f.p)-f.radius)*.5));
    if(world.time>=(f.steerUntil||0)) {
        var previousSteer=f.steer||f.direction;
        var recovering=f.recoverUntil>world.time;
        if(recovering)desired=limitPitch(unit(sub(f.recoverTarget,f.p)));
        var candidates=recovering?[desired]:[desired,previousSteer,f.direction,limitPitch(gradient(world,f.p))];
        var direct=compactForecast(world,f,desired,trialSpeed);
        if(!recovering&&(direct.room<8||!direct.connected||dot(f.direction,desired)<.4)) {
            for(var yaw=-3;yaw<=3;yaw++)for(var pitch=-1;pitch<=1;pitch++) {
                var a=Math.atan2(f.direction[0],f.direction[2])+yaw*.85;
                var b=clamp(Math.asin(f.direction[1])+pitch*.6,-.9,.9);
                candidates.push([Math.sin(a)*Math.cos(b),Math.sin(b),Math.cos(a)*Math.cos(b)]);
            }
        }
        var best=-Infinity;
        for(var c=0;c<candidates.length;c++) {
            var d=candidates[c],forecast=c===0?direct:compactForecast(world,f,d,trialSpeed),room=forecast.room;
            // During a checked passage, prefer progress through safe narrow
            // water. The usual open-water clearance bonus otherwise outweighs
            // the destination and keeps fish circling outside the entrance.
            var passage=!!f.passage;
            var score=(room<safetyRoom?-500+room*30:Math.min(6,room)*(passage?1:4))+Math.min(12,forecast.endRoom)*(passage?.3:2)+dot(d,desired)*(passage?36:18)+dot(d,previousSteer)*4-(forecast.connected?0:300);
            if(score>best){best=score;f.steer=d;f.forwardRoom=room;}
        }
        f.steerUntil=world.time+.16;
    }
    // Smooth turning intent and effort at route corners. Final steps still
    // check the complete body against scenery, the frame and the rear wall.
    f.smoothSteer=turnInWater(f.smoothSteer||f.direction,f.steer,dt*1.8);
    var previous=f.direction;
    f.direction=turnInWater(f.direction,f.smoothSteer,dt*(f.mode==='burst'||f.recoverUntil>world.time?1.15:.85));
    var turn=(previous[2]*f.direction[0]-previous[0]*f.direction[2])/dt;
    f.bank+=(clamp(-turn*12,-12,12)-f.bank)*(1-Math.exp(-dt*2.5));
    var wanted=cruiseSpeed*(f.mode==='hover'?.035:1);
    // Ease into the checked recovery arc while turning. Holding speed at
    // zero until near-perfect alignment added several seconds to a U-turn.
    wanted*=f.forwardRoom>safetyRoom*.8?clamp((f.forwardRoom+1)/6,.3,1):0;
    if(f.recoverUntil>world.time)wanted=Math.min(wanted,trialSpeed);
    wanted*=.25+.75*Math.max(0,dot(f.direction,f.smoothSteer));
    var acceleration=clamp((wanted-f.speed)*2,-f.cruise*1.3,f.cruise*.65);
    f.acceleration=(f.acceleration||0)+clamp(acceleration-(f.acceleration||0),-f.cruise*3*dt,f.cruise*3*dt);
    f.speed=clamp(f.speed+f.acceleration*dt,0,f.cruise*1.8);
    var next=add(f.p,mul(f.direction,f.speed*dt));
    if(valid(world,next,f.radius))f.p=next;
    else {f.speed=0;f.acceleration=0;f.steerUntil=0;f.goalAge=f.goalLimit+1;world.blockedSteps++;}
    if(f.effort===undefined)f.effort=f.speed/f.cruise;
    f.effort+=(f.speed/f.cruise-f.effort)*(1-Math.exp(-dt*3));
    f.phase+=dt*(.20+.8*f.effort);
    trackHidden(world,f,dt);
}
function step(world, dt) {
    world.time += dt;
    for (var i=0; i<world.fish.length; i++) {
        var f=world.fish[i];
        if(f.bodyOffsets) {stepLongBody(world,f,dt);continue;}
        if(world.field.enforceVisibleFrame) {stepContainedFish(world,f,dt);continue;}
        f.goalAge+=dt;
        if (world.time>=f.until) chooseMode(world,f);
        if (length(sub(f.goal,f.p))<12 || f.goalAge>f.goalLimit) newDestination(world,f);
        while(f.routeAt<f.route.length-1&&length(sub(f.route[f.routeAt],f.p))<14)f.routeAt++;
        var desired=unit(sub(f.route[f.routeAt]||f.goal,f.p));
        desired=limitPitch(desired);
        if(viewClearance(world,f.p)<f.radius+5) {
            // Shape the preferred heading before obstacle avoidance, so a
            // return into frame never overrides steering around a coral.
            var planes=world.field.viewPlanes||[];
            for(var pi=0;pi<planes.length;pi++) {
                var plane=planes[pi],room=dot(plane.normal,f.p)-plane.offset;
                if(room<f.radius+5)desired=unit(add(desired,mul(plane.normal,Math.min(1,(f.radius+5-room)/15))));
            }
        }
        var forwardRoom=space(world,add(f.p,mul(f.direction,18+f.speed*.9)))-f.radius;
        var steer=desired;
        // Sample a fan of directions in full 3D when the forward corridor
        // narrows. A fish can choose up, down, left, right or a depth turn.
        if (forwardRoom<18 || space(world,f.p)<f.radius+10) {
            var best=-Infinity, bestDirection=desired;
            var candidates=[desired, gradient(world,f.p)];
            for (var yaw=-2; yaw<=2; yaw++) for (var pitch=-1; pitch<=1; pitch++) {
                var a=Math.atan2(f.direction[0],f.direction[2])+yaw*.52;
                var p=clamp(Math.asin(f.direction[1])+pitch*.52,-.90,.90);
                candidates.push([Math.sin(a)*Math.cos(p),Math.sin(p),Math.cos(a)*Math.cos(p)]);
            }
            for (var c=0;c<candidates.length;c++) {
                var d=unit(candidates[c]);
                var near=space(world,add(f.p,mul(d,12)))-f.radius;
                var far=space(world,add(f.p,mul(d,30)))-f.radius;
                var score=Math.min(10,near)*2+Math.min(10,far)+dot(d,desired)*30+dot(d,f.direction)*5;
                if(score>best){best=score;bestDirection=d;}
            }
            steer=bestDirection;
        }
        // Neighbours repel only in physical space, so fish at different depths
        // can still cross naturally in the image.
        for (var n=0;n<world.fish.length;n++) if(n!==i) {
            var other=world.fish[n], delta=sub(f.p,other.p);
            if(other.bodyOffsets) {
                var along=clamp(dot(delta,other.direction),other.bodyOffsets[0],other.bodyOffsets[other.bodyOffsets.length-1]);
                delta=sub(delta,mul(other.direction,along));
            }
            var distance=length(delta);
            var comfort=f.radius+other.radius+10;
            if(distance<comfort) steer=unit(add(steer,mul(unit(delta),(comfort-distance)/comfort*2)));
        }
        if(world.field.enforceVisibleFrame) {
            f.stillFor=f.speed<.15&&f.mode!=='hover'?(f.stillFor||0)+dt:0;
            if(f.stillFor>2) {
                f.escapeUntil=world.time+5;f.stillFor=0;
                f.recoveries=(f.recoveries||0)+1;
                f.goalAge=f.goalLimit+1;
            }
            // At a tight edge, neighbour repulsion or a failed route can keep
            // cancelling the inward turn. Briefly give clearance priority;
            // the normal turn-rate and full-body movement checks still apply.
            if(f.escapeUntil>world.time&&space(world,f.p)<f.radius+12) {
                var inward=gradient(world,f.p);
                if(length(inward)>.1)steer=inward;
                f.mode='cruise';
            }
        }
        var previous=f.direction;
        steer=limitPitch(unit(steer));
        f.direction=limitPitch(turnTowards(f.direction,steer,dt*(f.mode==='burst'?1.15:.85)));
        var turn=(previous[2]*f.direction[0]-previous[0]*f.direction[2])/dt;
        f.bank+=(clamp(-turn*12,-12,12)-f.bank)*(1-Math.exp(-dt*4));
        var wanted=f.cruise*(f.mode==='hover'?.035:f.mode==='burst'?1.8:1);
        var corridor=space(world,add(f.p,mul(f.direction,Math.max(7,f.speed*.65))))-f.radius;
        wanted*=clamp(corridor/12,0,1);
        // Slow into sharp turns. Acceleration is finite; no position teleports.
        wanted*=.28+.72*Math.max(0,dot(f.direction,steer));
        f.speed+=clamp(wanted-f.speed,-f.cruise*2.5*dt,f.cruise*.7*dt);
        var next=add(f.p,mul(f.direction,f.speed*dt));
        if(valid(world,next,f.radius)) f.p=next;
        else { f.speed=0; world.blockedSteps++; f.goalAge=f.goalLimit+1; }
        f.phase+=dt*(.20+.8*f.speed/f.cruise);
        var index=fieldIndex(world.field,f.p),hidden=world.field.occlusionDepth&&index>=0&&world.field.occlusionDepth[index]>f.radius+5;
        if(hidden) {f.hiddenSeconds+=dt;f.hiddenFor+=dt;}
        else {if(f.hiddenFor>.75)f.reappearances++;f.hiddenFor=0;}
    }
}
function advance(world, elapsed) {
    world.accumulator+=elapsed;
    var count=Math.floor((world.accumulator+1e-9)*60);
    for(var i=0;i<count;i++) step(world,1/60);
    world.accumulator=Math.max(0,world.accumulator-count/60);
}
function report(world) {
    return {seed:world.seed,time:world.time,blockedSteps:world.blockedSteps,failedRoutes:world.failedRoutes,routeExpansions:world.routeExpansions,
            fish:world.fish.map(function(f){return {id:f.id,species:f.species,position:f.p.slice(),
                direction:f.direction.slice(),speed:f.speed,travelSign:f.travelSign||1,recoveries:f.recoveries||0,mode:f.mode,phase:f.phase,choices:f.choices,
                clearance:space(world,f.p),bodyClearance:bodySpace(world,f,f.p,f.direction),radius:f.radius,region:f.region,goal:f.goal,
                hiddenSeconds:f.hiddenSeconds,reappearances:f.reappearances};})};
}
