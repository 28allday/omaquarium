// Reference-derived sprite atlas and broad, independently phased swim routes.
var rects = [[46, 134, 253, 170], [352, 130, 251, 176], [656, 53, 245, 279], [959, 119, 242, 191], [30, 414, 274, 183], [357, 428, 239, 162], [656, 388, 253, 193], [959, 360, 280, 267], [47, 655, 246, 262], [340, 680, 274, 223], [648, 665, 281, 247], [969, 701, 256, 202], [41, 994, 259, 179], [345, 979, 269, 195], [654, 984, 260, 195], [972, 1006, 248, 167]]

var eyes = [[.15,.47],[.18,.39],[.18,.58],[.32,.45],
            [.12,.54],[.15,.47],[.13,.68],[.22,.54],
            [.14,.58],[.14,.47],[.15,.55],[.23,.27],
            [.16,.45],[.15,.52],[.16,.45],[.15,.45]]
function species(name,index) {
    if(name==="clown")return index===2?12:0
    if(name==="tang")return 1
    if(name==="moorish-idol")return 2
    if(name==="copperband-butterflyfish")return 3
    if(name.indexOf("anthias")>=0)return index%2?4:13
    if(name==="royal-gramma")return 5
    if(name==="purple-firefish")return 6
    if(name==="red-lionfish")return 7
    if(name==="banggai-cardinalfish")return 8
    if(name==="emperor-angelfish")return 9
    if(name==="mandarin-dragonet")return 10
    return 15
}
function width(name) {
    if(name==="moorish-idol")return 137
    if(name==="red-lionfish")return 156
    if(name==="copperband-butterflyfish")return 133
    if(name==="tang"||name==="emperor-angelfish")return 139
    if(name==="banggai-cardinalfish")return 87
    return 124
}
var heights = [.23,.16,.37,.13,.29,.20,.68,.32,.44,.55,.25,.14,
               .61,.38,.17,.43,.24,.13,.68,.52,.35,.16,.39,.57]
function pose(index,count,t,seed,name,size) {
    name=name||"clown"; size=size||1
    var bridge=index===6||index===18
    var depth=bridge?.80:.68+(index%4)*.075
    var prominent=[0,1,7,10].indexOf(index)>=0
    var spriteWidth=width(name)*size*(prominent?1:depth)
    var crop=rects[species(name,index)]
    var spriteHeight=spriteWidth*crop[3]/crop[2]
    var margin=Math.max(.070,spriteWidth/3840+.025)
    var phase=index*2.399+(seed%997)*.006
    // Two relaxed crossings per cycle, instead of hovering around a home spot.
    // Lionfish cruise more slowly; smaller companions are more active.
    var period=(name==="red-lionfish"?88:64)+(index%6)*3
    var angle=t*2*Math.PI/period+phase
    var x=.5+(0.5-margin)*Math.sin(angle)
    var base=heights[index%heights.length]
    if(count<=6)base=[.23,.16,.36,.29,.13,.46][index]
    // Low foreground lanes cross the opening under the beam; the rock art
    // remains behind these swimmers, as in the other 2D foreground routes.
    var drift=bridge?.023:.055+(index%3)*.012
    var y=base+Math.sin(angle*.77+phase*.31)*drift
    var top=Math.max(.080,spriteHeight/2160+.025)
    var bottom=Math.min(.735,1-spriteHeight/2160-.04)
    y=Math.max(top,Math.min(bottom,y))
    return {x:x,y:y,turn:Math.cos(angle)>0?-1:1,depth:depth}
}
