pragma ComponentBehavior: Bound
import QtQuick3D

Model {
    id:bubble
    visible:false
    source:"#Sphere"
    castsShadows:false
    receivesShadows:false
    property real fade:1
    materials:BubbleMaterial {strength:bubble.fade}
}
