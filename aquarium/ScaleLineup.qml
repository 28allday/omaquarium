pragma ComponentBehavior: Bound
import QtQuick
import QtQuick3D

Item {
    id: chart
    property var catalogue: []
    property real pixelsPerCm: 4
    function projectionReport() {
        var a=view.mapFrom3DScene(Qt.vector3d(0,0,0))
        var b=view.mapFrom3DScene(Qt.vector3d(10,0,0))
        return {tenCmPixels:b.x-a.x,appearances:catalogue.length}
    }
    Rectangle {anchors.fill:parent;color:"#091f30"}
    Text {textFormat:Text.PlainText;x:48;y:28;text:"Fish at the same scale";color:"#eef7fa";font.pixelSize:32}
    Text {textFormat:Text.PlainText;x:48;y:72;text:"Authored specimen lengths • Side view • G returns to the tank";color:"#a7c4d4";font.pixelSize:21}
    View3D {
        id:view
        anchors.fill:parent
        explicitTextureWidth:1920;explicitTextureHeight:1080
        camera:camera
        environment:SceneEnvironment {
            backgroundMode:SceneEnvironment.Transparent
            antialiasingMode:SceneEnvironment.MSAA;antialiasingQuality:SceneEnvironment.High
            tonemapMode:SceneEnvironment.TonemapModeFilmic
            lightProbe:Texture {source:"bake/reef-probe.hdr";mappingMode:Texture.LightProbe}
            probeExposure:1.1
        }
        OrthographicCamera {
            id:camera;z:500;clipNear:1;clipFar:1000
            horizontalMagnification:chart.pixelsPerCm;verticalMagnification:chart.pixelsPerCm
        }
        DirectionalLight {eulerRotation:Qt.vector3d(-65,-24,0);color:"#e1eeff";brightness:1.05;ambientColor:"#4a6680"}
        DirectionalLight {eulerRotation:Qt.vector3d(-12,145,0);color:"#559edd";brightness:.36}
        Repeater3D {
            model:chart.catalogue
            LiveFish {
                id:specimen
                required property int index
                required property var modelData
                specification:modelData
                onReadyChanged:if(ready)pose({
                    p:[((index%4)*480+240-chart.width/2)/chart.pixelsPerCm,
                       (chart.height/2-(180+Math.floor(index/4)*230))/chart.pixelsPerCm,0],
                    direction:[1,0,0],bank:0,phase:0})
            }
        }
    }
    Repeater {
        model:chart.catalogue
        Item {
            required property int index
            required property var modelData
            x:(index%4)*480;y:278+Math.floor(index/4)*230;width:480;height:48
            Text {textFormat:Text.PlainText;anchors.horizontalCenter:parent.horizontalCenter;text:parent.modelData.name+" · "+parent.modelData.lengthCm+" cm";color:"#e1edf3";font.pixelSize:20}
        }
    }
    Item {
        x:1030;y:865;width:800;height:140
        Rectangle {x:0;y:30;width:100*chart.pixelsPerCm;height:2;color:"#9acac9"}
        Repeater {
            model:11
            Rectangle {required property int index;x:index*10*chart.pixelsPerCm;y:22;width:2;height:index%5===0?20:10;color:"#9acac9"}
        }
        Text {textFormat:Text.PlainText;y:62;text:"100 cm / 1 metre";color:"#d3ebe7";font.pixelSize:22}
        Text {textFormat:Text.PlainText;y:102;text:"Equal size here means equal size in the tank.\nSmall species stay small; depth does not alter this comparison.";color:"#a7c4d4";font.pixelSize:19}
    }
}
