pragma ComponentBehavior: Bound
import QtQuick
import QtQuick3D

Node {
    id: fish
    property var specification: null
    property var asset: null
    property real phase: 0
    property bool ready: false
    function animatePose() {
        if(!ready)return
        var frame=((phase*1000)%specification.durationMs+specification.durationMs)%specification.durationMs
        if(specification.control==="poseTimeMs")asset.poseTimeMs=frame
        else asset.timelineMap.Swim.currentFrame=frame
    }
    function pose(f) {
        position=Qt.vector3d(f.p[0],f.p[1],f.p[2])
        rotation=Quaternion.fromEulerAngles(-Math.asin(f.direction[1])*180/Math.PI,
                    Math.atan2(f.direction[0],f.direction[2])*180/Math.PI,f.bank)
        phase=f.phase
        animatePose()
    }
    Loader3D {
        source:fish.specification?Qt.resolvedUrl(fish.specification.source):""
        onLoaded: {
            fish.asset=item
            var factor=fish.specification.scale
            fish.asset.scale=Qt.vector3d(factor,factor,factor)
            if(fish.specification.control==="poseTimeMs") {
                fish.asset.animate=false
                fish.asset.clip="Swim"
            } else {
                for(var timeline of fish.asset.timelineList)timeline.enabled=false
                fish.asset.timelineMap.Swim.enabled=true
            }
            fish.ready=true
            fish.animatePose()
        }
    }
}
