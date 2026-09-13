VARYING vec2 irisPosition;
void MAIN()
{
    float r = length(irisPosition);
    float angle = atan(irisPosition.y, irisPosition.x);
    float filaments = 0.5 + 0.5 * sin(angle * 43.0 + sin(angle * 17.0) * 1.5 + r * 9.0);
    vec3 iris = mix(vec3(0.17, 0.14, 0.070), vec3(0.42, 0.39, 0.22), filaments);
    iris = mix(vec3(0.009, 0.012, 0.009), iris, smoothstep(0.30, 0.38, r));
    iris = mix(iris, vec3(0.022, 0.027, 0.018), smoothstep(0.74, 0.95, r));
    BASE_COLOR = vec4(iris * caveExposure, 1.0);
    METALNESS = 0.0;
    ROUGHNESS = 0.19;
    SPECULAR_AMOUNT = 0.48;
    EMISSIVE_COLOR = iris * caveExposure * 0.12;
}
