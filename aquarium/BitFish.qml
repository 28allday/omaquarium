import QtQuick
import "BitArt.js" as Art

Item {
    id: fish
    property int atlasIndex: 0
    property real time: 0
    readonly property bool ready: sprite.status === Image.Ready
    Image {
        id: sprite
        source: "bit-art/fish-atlas-v1.png"
        sourceClipRect: Qt.rect(...Art.rects[fish.atlasIndex])
        smooth: false
        visible: false
    }
    ShaderEffect {
        anchors.fill: parent
        property var source: sprite
        property real phase: fish.time * 5.5
        property size spriteSize: Qt.size(width,height)
        property size pixelGrid: Qt.size(Math.max(10,Math.round(width/7.5)),Math.max(8,Math.round(height/7.5)))
        property point eye: Qt.point(...Art.eyes[fish.atlasIndex])
        mesh: GridMesh { resolution: Qt.size(20,12) }
        vertexShader: "art-fish.vert.qsb"
        fragmentShader: "art-fish.frag.qsb"
    }
}
