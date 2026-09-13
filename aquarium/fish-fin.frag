// Thin fin membrane: retain the authored pigment, alpha and fin-ray relief.
void MAIN()
{
    vec4 pigment = texture(pigmentMap, UV0);
    // Custom samplers supply the image values; material lighting needs linear RGB.
    vec3 rgb = pigment.rgb;
    rgb = mix(rgb / 12.92, pow((rgb + 0.055) / 1.055, vec3(2.4)),
              greaterThan(rgb, vec3(0.04045)));
    BASE_COLOR = vec4(rgb, pigment.a);
    METALNESS = 0.0;
    ROUGHNESS = clamp(texture(surfaceMap, UV0).g * 0.92, 0.28, 0.65);
    SPECULAR_AMOUNT = 0.20;
    vec3 bump = texture(reliefMap, UV0).xyz * 2.0 - 1.0;
    bump.xy *= 0.55;
    NORMAL = normalize(mat3(normalize(TANGENT), normalize(BINORMAL), normalize(NORMAL)) * normalize(bump));
}
void DIRECTIONAL_LIGHT()
{
    float facing = dot(normalize(NORMAL), TO_LIGHT_DIR);
    float front = max(facing, 0.0);
    float through = max(-facing, 0.0) * 0.42;
    DIFFUSE += BASE_COLOR.rgb * LIGHT_COLOR * SHADOW_CONTRIB * (front + through);
}
