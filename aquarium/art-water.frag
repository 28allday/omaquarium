#version 440
layout(location=0) in vec2 qt_TexCoord0;
layout(location=0) out vec4 fragColor;
layout(std140,binding=0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float time;
};
layout(binding=1) uniform sampler2D source;
void main() {
    vec2 uv=qt_TexCoord0;
    // Sway only rooted leaves at the far sides; the arch stays still.
    float edges=1.-smoothstep(.105,.155,min(uv.x,1.-uv.x));
    float rooted=(1.-smoothstep(.60,.79,uv.y))*smoothstep(.23,.34,uv.y);
    uv.x+=round(sin(time*.65+uv.y*9.+uv.x*7.)*1.1)*edges*rooted/640.;
    fragColor=texture(source,clamp(uv,vec2(0.),vec2(1.)))*qt_Opacity;
}
