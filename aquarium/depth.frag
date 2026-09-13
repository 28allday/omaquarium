// Opaque-pass geometry writes depth while leaving the offscreen colour target
// transparent. The baked image underneath supplies the scenery's radiance.
void MAIN() { FRAGCOLOR = vec4(0.0); }
