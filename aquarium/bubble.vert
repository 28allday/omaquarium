VARYING vec3 bubbleNormal;
VARYING vec3 bubblePosition;
void MAIN() {
    POSITION=MODELVIEWPROJECTION_MATRIX*vec4(VERTEX,1.0);
    bubbleNormal=normalize(NORMAL_MATRIX*NORMAL);
    bubblePosition=(MODEL_MATRIX*vec4(VERTEX,1.0)).xyz;
}
