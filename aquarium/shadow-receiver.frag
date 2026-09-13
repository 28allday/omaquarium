SHARED_VARS { float occlusion; };
void MAIN()
{
    BASE_COLOR = vec4(0.0);
    METALNESS = 0.0;
    SPECULAR_AMOUNT = 0.0;
    SHARED.occlusion = 0.0;
}
void DIRECTIONAL_LIGHT()
{
    SHARED.occlusion = max(SHARED.occlusion, 1.0 - SHADOW_CONTRIB);
}
void POST_PROCESS()
{
    COLOR_SUM = vec4(0.0, 0.0, 0.0, SHARED.occlusion * 0.32);
}
