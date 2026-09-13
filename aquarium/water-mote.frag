VARYING vec2 moteUv;
VARYING float moteAlpha;
VARYING float moteTint;
void MAIN() {
    float radius=length(moteUv);
    float softEdge=(1.0-smoothstep(.60,1.0,radius))*exp(-1.5*radius*radius);
    // Slight warm/cool variation in light scattered by pale suspended matter.
    vec3 colour=mix(vec3(.88,1.00,1.05),vec3(1.10,1.05,.87),moteTint*.45);
    FRAGCOLOR=vec4(colour,softEdge*moteAlpha);
}
