#version 440
layout(location=0) in vec2 qt_TexCoord0;
layout(location=0) out vec4 fragColor;
layout(std140,binding=0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec4 shade0;
    vec4 shade1;
    vec4 shade2;
    vec4 shade3;
    float dim;
};
layout(binding=1) uniform sampler2D source;
void main() {
    vec2 uv=(floor(qt_TexCoord0*vec2(640.,360.))+.5)/vec2(640.,360.);
    vec3 c=texture(source,uv).rgb;
    float light=dot(c,vec3(.299,.587,.114));
    // Map the reference's actual dark rock, midtone, water and sand levels
    // separately, so the shadows keep their depth under every system theme.
    float tone=light<.43?(light-.20)/.23:
               light<.64?1.+(light-.43)/.21:2.+(light-.64)/.22;
    float ramp=floor(clamp(tone,0.,3.)*21.+.5)/21.;
    vec3 col=ramp<1.?mix(shade0.rgb,shade1.rgb,ramp):
             ramp<2.?mix(shade1.rgb,shade2.rgb,ramp-1.):mix(shade2.rgb,shade3.rgb,ramp-2.);
    col=floor(col*dim*255.+.5)/255.;
    fragColor=vec4(col,1.)*qt_Opacity;
}
