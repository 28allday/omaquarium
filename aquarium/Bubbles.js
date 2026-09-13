// Live, bounded bubbles in centimetres, sharing the fish's pauseable 60 Hz clock.
// A separate seeded source keeps bubble toggles from changing fish routes.
var CAPACITY = 64;
function randomSource(seed) {
    var value=seed>>>0;
    return function(){value=(Math.imul(value,1664525)+1013904223)>>>0;return value/4294967296;};
}
function create(seed,tiki) {
    if(!tiki)return null;
    return {time:0,accumulator:0,random:randomSource(seed^0x51bba),
            origin:tiki.bubbleOutlet.slice(),direction:tiki.bubbleDirection.slice(),
            particles:[],wait:.5,remaining:0,emission:0,bursts:0,emitted:0};
}
function burst(state) {
    if(!state)return;
    state.remaining=1.4+state.random()*1.8;state.emission=0;state.bursts++;
}
function step(state,dt,enabled) {
    state.time+=dt;
    if(!enabled){state.particles=[];state.remaining=0;state.wait=.5;return;}
    if(state.remaining<=0) {
        state.wait-=dt;
        if(state.wait<=0)burst(state);
    }
    if(state.remaining>0) {
        state.remaining-=dt;state.emission-=dt;
        if(state.emission<=0) {
            var random=state.random;
            if(state.particles.length<CAPACITY) {
                var radius=.28+.64*Math.pow(random(),1.5);
                state.particles.push({age:0,radius:radius,rise:13+radius*10+random()*3,
                    phase:random()*Math.PI*2,drift:(random()-.5)*.8,
                    p:state.origin.slice(),scale:radius/50,fade:1});
                state.emitted++;
            }
            state.emission=.060+random()*.055;
        }
        if(state.remaining<=0)state.wait=6+state.random()*7;
    }
    for(var i=state.particles.length-1;i>=0;i--) {
        var b=state.particles[i];b.age+=dt;
        var a=b.age,outward=7*(1-Math.exp(-a*6)),growth=1+Math.min(.16,a*.012);
        // Clear the projecting nose, then drift and wobble upward in real 3D.
        b.p=[state.origin[0]+state.direction[0]*outward+b.drift*a+1.1*(Math.sin(a*2.5+b.phase)-Math.sin(b.phase)),
             state.origin[1]+b.rise*(a-.12*(1-Math.exp(-a/.12))),
             state.origin[2]+state.direction[2]*outward+.35*a+1.2*(Math.sin(a*1.6+b.phase)-Math.sin(b.phase))];
        b.scale=b.radius*growth/50;
        b.fade=Math.min(1,a*12)*Math.max(0,Math.min(1,(220-b.p[1])/18));
        if(b.p[1]>220||a>18)state.particles.splice(i,1);
    }
}
function advance(state,elapsed,enabled) {
    if(!state)return;
    state.accumulator+=elapsed;
    var count=Math.floor((state.accumulator+1e-9)*60);
    for(var i=0;i<count;i++)step(state,1/60,enabled);
    state.accumulator=Math.max(0,state.accumulator-count/60);
}
function report(state) {
    return state?{time:state.time,count:state.particles.length,bursts:state.bursts,
                  emitted:state.emitted,outlet:state.origin}:null;
}
