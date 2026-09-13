pragma ComponentBehavior: Bound
import QtQuick3D

Model {
    id: motes
    property real timeSeconds: 0
    property real strength: 1
    readonly property int count: instances.instanceCount
    source: "#Rectangle"
    castsShadows: false
    receivesShadows: false
    instancing: FileInstancing {
        id: instances
        source: "water-motes.xml"
        hasTransparency: true
        depthSortingEnabled: true
    }
    materials: CustomMaterial {
        property real waterTime: motes.timeSeconds
        property real waterStrength: motes.strength
        shadingMode: CustomMaterial.Unshaded
        sourceBlend: CustomMaterial.SrcAlpha
        destinationBlend: CustomMaterial.OneMinusSrcAlpha
        sourceAlphaBlend: CustomMaterial.One
        destinationAlphaBlend: CustomMaterial.OneMinusSrcAlpha
        cullMode: Material.NoCulling
        depthDrawMode: Material.NeverDepthDraw
        vertexShader: "water-mote.vert"
        fragmentShader: "water-mote.frag"
    }
}
