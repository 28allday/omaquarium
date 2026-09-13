pragma ComponentBehavior: Bound
import QtQuick
import QtQuick3D
import "CaveMoray.js" as Cave

Node {
    id: resident
    required property var specification
    property real timeMs: 0
    property var state: Cave.sample(timeMs/1000,specification)
    property var asset: model.item
    property url modelSource: "fish/zebra-moray-eel/Zebra_moray_eel_low.qml"
    position: Qt.vector3d(...state.position)
    rotation: Quaternion.fromEulerAngles(-Math.asin(specification.direction[1])*180/Math.PI,
        Math.atan2(specification.direction[0],specification.direction[2])*180/Math.PI,0)
    function report() {
        return {ready:!!asset,mode:state.mode,timeMs:timeMs,position:state.position,
            reachCm:state.reachCm,entrance:specification.entrance,direction:specification.direction,
            modelScale:specification.modelScale, lengthCm:specification.lengthCm,
            clip:asset?asset.clip:"",poseTimeMs:asset?asset.poseTimeMs:0};
    }
    Loader3D {
        id: model
        source: resident.modelSource
        onLoaded: {
            if(!item)return
            item.scale=Qt.vector3d(...resident.specification.modelScale)
            item.animate=false
            item.clip="Idle"
        }
    }
    Binding {
        target:model.item
        property:"poseTimeMs"
        value:resident.state.idleTimeMs
        when:model.item!==null
    }
    Binding {
        target:model.item
        property:"caveLight"
        value:.16+.69*resident.state.extension
        when:model.item!==null
    }
}
