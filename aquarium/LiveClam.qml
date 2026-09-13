import QtQuick
import QtQuick3D

Node {
    id: clam
    required property var specification
    property real timeMs: 0
    position: Qt.vector3d(...specification.position)
    eulerRotation.y: specification.yaw
    scale: Qt.vector3d(specification.scale,specification.scale,specification.scale)
    Loader3D {
        id: model
        source: "clam/Giant_clam_low.qml"
        onLoaded: if(item) {item.animate=false;item.clip=clam.specification.clip}
    }
    Binding {
        target: model.item
        property: "poseTimeMs"
        value: clam.timeMs%clam.specification.durationMs
        when: model.item!==null
    }
}
