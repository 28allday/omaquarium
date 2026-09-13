void MAIN()
{
    // Clear membranes should not cast the silhouette of a solid sheet.
    if (finMembrane && texture(shadowPigment, UV0).a < 0.38)
        discard;
    BASE_COLOR = vec4(0.0, 0.0, 0.0, 1.0);
    SPECULAR_AMOUNT = 0.0;
    ROUGHNESS = 1.0;
}
void DIRECTIONAL_LIGHT() {}
void AMBIENT_LIGHT() {}
void POST_PROCESS() { COLOR_SUM = vec4(0.0); }
