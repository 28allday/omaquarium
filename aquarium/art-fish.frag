#version 440
layout(location=0) in vec2 qt_TexCoord0;
layout(location=0) out vec4 fragColor;
layout(std140,binding=0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float phase;
    vec2 spriteSize;
    vec2 pixelGrid;
    vec2 eye;
};
layout(binding=1) uniform sampler2D source;
vec4 keyed(vec2 uv) {
    if(any(lessThan(uv,vec2(0.)))||any(greaterThan(uv,vec2(1.))))return vec4(0.);
    vec4 c=texture(source,uv);
    float a=smoothstep(.035,.07,c.g-min(c.r,c.b))*c.a;
    return vec4(c.rgb*a,a);
}
vec4 cellColour(vec2 cell) {
    float tail=pow(smoothstep(.30,.98,(cell.x+.5)/pixelGrid.x),1.5);
    cell.y+=round(sin(phase-cell.x*.24)*tail*.8);
    vec2 uv=(cell+.5)/pixelGrid,d=.28/pixelGrid;
    return keyed(uv)*.4+(keyed(uv+vec2(-d.x,-d.y))+keyed(uv+vec2(d.x,-d.y))+
           keyed(uv+vec2(-d.x,d.y))+keyed(uv+vec2(d.x,d.y)))*.15;
}
void main() {
    vec2 cell=floor(qt_TexCoord0*pixelGrid);
    vec4 c=cellColour(cell);
    float mask=step(.42,c.a), l=dot(c.rgb/max(c.a,.001),vec3(.299,.587,.114));
    float edge=min(min(cellColour(cell+vec2(-1.,0.)).a,cellColour(cell+vec2(1.,0.)).a),
                   min(cellColour(cell+vec2(0.,-1.)).a,cellColour(cell+vec2(0.,1.)).a));
    // Six deliberate body shades and a continuous one-pixel silhouette.
    vec3 colour=l<.27?vec3(.11,.22,.13):l<.39?vec3(.18,.34,.18):
                l<.50?vec3(.28,.43,.22):l<.63?vec3(.48,.58,.30):
                l<.78?vec3(.65,.71,.40):vec3(.88,.91,.59);
    if(edge<.42)colour=vec3(.11,.22,.13);
    // One light pixel in a dark eye socket stays legible at all fish sizes.
    vec2 eyeCell=floor(eye*pixelGrid);
    if(length(cell-eyeCell)<=1.01)colour=vec3(.11,.22,.13);
    if(all(equal(cell,eyeCell))){colour=vec3(.88,.91,.59);mask=1.;}
    fragColor=vec4(colour*mask,mask)*qt_Opacity;
}
