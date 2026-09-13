// Keep the two ends of the cylindrical body atlas continuous. Its black
// unused border otherwise leaks into the flank through coarse mip levels.
vec4 bodySample(sampler2D atlas, vec2 uv, float lod, float guard, float seam) {
    vec2 inner = uv;
    inner.y = clamp(uv.y, .01 + guard, .94 - guard);
    vec4 pigment = textureLod(atlas, inner, lod);
    vec4 join = .5 * (textureLod(atlas, vec2(uv.x, .01 + guard), lod)
                   + textureLod(atlas, vec2(uv.x, .94 - guard), lod));
    return mix(join, pigment, seam);
}

void MAIN() {
    vec2 uv = UV0;
    vec2 footprint = max(abs(dFdx(uv)), abs(dFdy(uv)));
    float lod = max(0.0, log2(max(footprint.x, footprint.y) * 2048.0));
    // Four texels of padding are all the delivery supplies. Stay inside the
    // painted island at distance; cap the mip before it covers empty atlas.
    lod = min(lod, 5.0);
    float guard = max(.003, exp2(lod) * 1.5 / 2048.0);
    float edge = min(uv.y - .01, .94 - uv.y);
    float seam = smoothstep(0.0, max(.012, guard * 2.0), edge);
    vec4 pigment;
    vec4 surface;
    vec3 relief;
    if (repairSeam && uv.y <= .941) {
        pigment = bodySample(pigmentMap, uv, lod, guard, seam);
        surface = bodySample(surfaceMap, uv, lod, guard, seam);
        relief = bodySample(reliefMap, uv, lod, guard, seam).xyz;
    } else {
        pigment = texture(pigmentMap, uv);
        surface = texture(surfaceMap, uv);
        relief = texture(reliefMap, uv).xyz;
    }
    vec3 linearPigment = mix(pigment.rgb / 12.92,
        pow((pigment.rgb + .055) / 1.055, vec3(2.4)),
        step(vec3(.04045), pigment.rgb));
    BASE_COLOR = vec4(linearPigment, 1.0);
    ROUGHNESS = .90 * surface.g;
    METALNESS = 0.0;
    SPECULAR_AMOUNT = .38;
    CLEARCOAT_AMOUNT = .18;
    CLEARCOAT_ROUGHNESS = .24;
    relief = relief * 2.0 - 1.0;
    relief.xy *= .70;
    NORMAL = normalize(mat3(normalize(TANGENT), normalize(BINORMAL), normalize(NORMAL)) * normalize(relief));
}
