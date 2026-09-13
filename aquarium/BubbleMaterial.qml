import QtQuick3D

CustomMaterial {
    property real strength: 1
    shadingMode: CustomMaterial.Unshaded
    sourceBlend: CustomMaterial.SrcAlpha
    destinationBlend: CustomMaterial.OneMinusSrcAlpha
    cullMode: Material.BackFaceCulling
    depthDrawMode: Material.NeverDepthDraw
    vertexShader: "bubble.vert"
    fragmentShader: "bubble.frag"
}
