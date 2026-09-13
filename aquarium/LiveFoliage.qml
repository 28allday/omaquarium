import QtQuick
import QtQuick3D

Node {
    id: plant
    required property var specification
    property real timeMs: 0
    position: Qt.vector3d(...specification.position)
    eulerRotation.y: specification.yaw
    scale: Qt.vector3d(specification.scale,specification.scale,specification.scale)
    Loader3D {
        id: model
        source: Qt.resolvedUrl(plant.specification.component||"foliage/Tropical_reef_foliage_low.qml")
        onLoaded: if(item) item.animate=false
    }
    Binding {
        target: model.item
        property: "poseTimeMs"
        value: (plant.timeMs+plant.specification.phaseMs)%6000
        when: model.item!==null
    }
}
