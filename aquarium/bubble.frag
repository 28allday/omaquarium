VARYING vec3 bubbleNormal;
VARYING vec3 bubblePosition;
void MAIN() {
    vec3 n=normalize(bubbleNormal);
    vec3 view=normalize(CAMERA_POSITION-bubblePosition);
    float rim=pow(1.0-abs(dot(n,view)),2.5);
    float highlight=pow(max(0.0,dot(n,normalize(vec3(-.40,.75,.54)))),28.0);
    vec3 colour=mix(vec3(.14,.37,.48),vec3(.68,.86,.95),rim)+vec3(highlight*.65);
    FRAGCOLOR=vec4(colour,(.012+rim*.43+highlight*.33)*strength);
}
