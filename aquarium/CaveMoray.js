// A cave resident has one fixed axis and hard travel stops, never a swim route.
function smooth(t) {t=Math.max(0,Math.min(1,t));return t*t*t*(10+t*(-15+6*t));}
function sample(seconds,spec) {
    var t=((seconds%spec.cycleSeconds)+spec.cycleSeconds)%spec.cycleSeconds;
    var extension;
    if(t<8)extension=1;
    else if(t<15)extension=1-smooth((t-8)/7);
    else if(t<23)extension=0;
    else if(t<33)extension=smooth((t-23)/10);
    else extension=1;
    var reach=spec.retractedCm+(spec.emergedCm-spec.retractedCm)*extension;
    var position=spec.entrance.map(function(v,i){return v+spec.direction[i]*(reach-spec.mouthOffsetCm);});
    return {position:position,reachCm:reach,extension:extension,
        idleTimeMs:(seconds*1000)%4000,mode:extension===1?'watching':extension===0?'sheltered':t<23?'retreating':'emerging'};
}
