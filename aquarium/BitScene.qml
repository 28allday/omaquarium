import QtQuick
import "BitArt.js" as Art

Item {
    id: bit
    property var palette: ["#172f24", "#3d6240", "#819c48", "#c2d178"]
    property var population: []
    property real time: 0
    property real fishSize: 1
    property int seed: 0
    property bool bubbles: true
    property bool particles: true
    property string lighting: "daylight"
    readonly property int frame: Math.floor(time * 16)
    readonly property real clock: frame / 16
    readonly property real dim: lighting === "moonlight" ? .70 : lighting === "dusk" ? .87 : 1
    layer.enabled: visible
    layer.textureSize: Qt.size(1920,1080)
    layer.smooth: false
    layer.effect: ShaderEffect {
        property var source
        property color shade0: bit.palette[0]
        property color shade1: bit.palette[1]
        property color shade2: bit.palette[2]
        property color shade3: bit.palette[3]
        property real dim: bit.dim
        fragmentShader: "art-theme.frag.qsb"
        blending: false
    }
    function report() {
        var positions = []
        for (var i = 0; i < swimmingFish.count; i++) {
            var item = swimmingFish.itemAt(i)
            if (item) positions.push({x:item.x+item.width/2, y:item.y+item.height/2})
        }
        return {style: "painted-sprites", resolution: [640,360], frame: frame,
            fish: population.length, shades: 64,
            positions: positions, resident: {x:residents.x,y:residents.y},
            artworkReady: reef.status === Image.Ready && residents.ready}
    }
    Image {
        id: reef
        anchors.fill: parent
        source: "bit-art/reef-reference-v1.png"
        smooth: false
        layer.enabled: bit.visible
        layer.effect: ShaderEffect {
            property var source
            property real time: bit.clock
            fragmentShader: "art-water.frag.qsb"
            blending: false
        }
    }
    BitFish {
        id: residents
        atlasIndex: 11
        width: 96 + 12 * (1 + Math.sin(bit.clock * Math.PI / 21)) / 2
        height: width * Art.rects[11][3] / Art.rects[11][2]
        x: bit.width * .646 - width / 2 - 4 * Math.sin(bit.clock * Math.PI / 21)
        y: bit.height * .805 - height / 2
        time: bit.clock * .4
    }
    Repeater {
        id: swimmingFish
        model: bit.population
        delegate: BitFish {
            id: swimmer
            required property int index
            required property var modelData
            readonly property var pose: Art.pose(index, bit.population.length, bit.clock, bit.seed, modelData.species, bit.fishSize)
            readonly property bool hero: [0,1,7,10].indexOf(index) >= 0
            atlasIndex: Art.species(modelData.species, index)
            width: Art.width(modelData.species) * bit.fishSize * (hero ? 1 : pose.depth)
            height: width * Art.rects[atlasIndex][3] / Art.rects[atlasIndex][2]
            x: Math.round((pose.x * bit.width - width / 2) / 3) * 3
            y: Math.round((pose.y * bit.height - height / 2) / 3) * 3
            time: bit.clock + index * .4
            transform: Scale {
                origin.x: swimmer.width / 2
                origin.y: swimmer.height / 2
                xScale: pose.turn
            }
        }
    }
    Repeater {
        model: bit.bubbles ? 12 : 0
        Rectangle {
            required property int index
            readonly property real rise: ((bit.clock * (5 + index % 2) + index * 9) % 111) / 144
            width: index % 3 === 0 ? 9 : 6
            height: width
            x: bit.width * ([.175,.418,.725,.803][index % 4] + Math.sin(index + rise * 12) * .003)
            y: bit.height * (.84 - rise)
            color: "#dce6a0"
        }
    }
    Repeater {
        model: bit.particles ? 6 : 0
        Rectangle {
            required property int index
            width: 3; height: 3
            x: bit.width * ((index * .173 + bit.clock * .0008) % 1)
            y: bit.height * (.13 + (index * .137 + bit.clock * .0004) % .58)
            color: "#b5c57b"
        }
    }
}
