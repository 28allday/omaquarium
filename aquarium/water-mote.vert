VARYING vec2 moteUv;
VARYING float moteAlpha;
VARYING float moteTint;
void MAIN() {
    float phase=INSTANCE_DATA.x;
    float t=waterTime*INSTANCE_DATA.y;
    // Gentle circulation with independent phases, not a falling snow sheet.
    vec3 drift=vec3(5.0*sin(t+phase)+1.2*sin(t*1.73+phase*2.0),
                    2.4*sin(t*.83+phase+1.0)+.6*sin(t*2.1+phase),
                    3.6*cos(t*.71+phase));
    vec4 centre=INSTANCE_MODEL_MATRIX*vec4(0.0,0.0,0.0,1.0);
    centre.xyz+=drift;
    vec4 viewCentre=VIEW_MATRIX*centre;
    float size=length(INSTANCE_MODEL_MATRIX[0].xyz);
    // Keep near-glass motes fine too: at most five pixels in the fixed 1920px
    // render target. Perspective variation remains below this optical cap.
    size=min(size,5.0*(-viewCentre.z)/(960.0*PROJECTION_MATRIX[0][0]*100.0));
    // Camera-facing quads retain physical depth, occlusion and perspective.
    vec2 footprint=VERTEX.xy*size;
    footprint.y*=.82+.30*INSTANCE_DATA.w;
    POSITION=PROJECTION_MATRIX*(viewCentre+vec4(footprint,0.0,0.0));
    moteUv=UV0*2.0-1.0;
    float depthFade=mix(1.0,.82,smoothstep(80.0,280.0,-viewCentre.z));
    float light=.90+.10*sin(t*.57+phase);
    moteAlpha=INSTANCE_DATA.z*depthFade*light*waterStrength;
    moteTint=INSTANCE_DATA.w;
}
