// Thin foliage: retain the delivered UV detail, with a greener pigment range
// and light transmitted through the back of the blade. No opacity trick.
VARYING float growthHeight;
void MAIN()
{
    vec3 pigment = texture(leafMap, UV0).rgb;
    float detail = dot(pigment, vec3(0.2126, 0.7152, 0.0722));
    float tone = clamp(smoothstep(pigmentLow, pigmentHigh, detail) * 0.68 + growthHeight * 0.32, 0.0, 1.0);
    float basalShade = mix(0.62, 1.12, smoothstep(0.0, 0.85, growthHeight));
    BASE_COLOR = vec4(mix(shadePigment, litPigment, tone) * basalShade, 1.0);
    // A thin pale midrib and branching secondary veins, filtered at distance.
    float bladeMask = smoothstep(0.01, 0.025, UV0.x);
    float midrib = exp(-pow((UV0.x - 0.5) / 0.018, 2.0));
    float veinPhase = UV0.y * 46.0 - abs(UV0.x - 0.5) * 3.0;
    float veinWidth = max(fwidth(veinPhase), 0.06);
    float vein = 1.0 - smoothstep(0.02, 0.02 + veinWidth, abs(fract(veinPhase) - 0.5));
    float edgeFade = smoothstep(0.0, 0.15, UV0.x) * smoothstep(0.0, 0.15, 1.0 - UV0.x);
    BASE_COLOR.rgb *= 1.0 + bladeMask * edgeFade * (0.09 * midrib + 0.045 * vein);
    METALNESS = 0.0;
    ROUGHNESS = 0.48 + 0.16 * texture(leafSurface, UV0).g;
    SPECULAR_AMOUNT = 0.22;
    vec3 bump = texture(leafNormal, UV0).xyz * 2.0 - 1.0;
    bump.xy *= 0.25;
    bump.x += bladeMask * 0.035 * midrib * sign(UV0.x - 0.5);
    NORMAL = normalize(mat3(normalize(TANGENT), normalize(BINORMAL), normalize(NORMAL)) * normalize(bump));
}

void DIRECTIONAL_LIGHT()
{
    float facing = dot(normalize(NORMAL), TO_LIGHT_DIR);
    float front = max(facing, 0.0);
    vec3 transmitted = vec3(1.15, 1.0, 0.65) * 0.60 * max(-facing, 0.0);
    DIFFUSE += BASE_COLOR.rgb * LIGHT_COLOR * SHADOW_CONTRIB * (vec3(front) + transmitted);
}
