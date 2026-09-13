pragma ComponentBehavior: Bound
import QtQuick
import QtQuick3D

Item {
    id:guide
    required property View3D viewport
    property var dimensions: null
    function refresh() {drawing.requestPaint()}
    onDimensionsChanged:refresh()
    onVisibleChanged:if(visible)refresh()
    Timer {interval:250;running:guide.visible;repeat:false;onTriggered:guide.refresh()}
    Canvas {
        id:drawing;anchors.fill:parent
        onPaint: {
            var c=getContext("2d");c.reset()
            if(!guide.dimensions)return
            function project(p) {return guide.viewport.mapFrom3DScene(Qt.vector3d(...p))}
            function line(a,b) {
                a=project(a);b=project(b);c.beginPath();c.moveTo(a.x,a.y);c.lineTo(b.x,b.y);c.stroke()
            }
            function label(p,text) {
                p=project(p);c.font="20px sans-serif";var w=c.measureText(text).width
                p.x=Math.max(w/2+16,Math.min(guide.width-w/2-16,p.x))
                c.fillStyle="#092236";c.fillRect(p.x-w/2-10,p.y-23,w+20,32)
                c.fillStyle="#e6f5f5";c.fillText(text,p.x-w/2,p.y)
            }
            var lo=guide.dimensions.swimBounds.lo,hi=guide.dimensions.swimBounds.hi
            c.lineWidth=1.5;c.strokeStyle="#74bcbc"
            var midDepth=(lo[2]+hi[2])/2
            line([lo[0],lo[1],midDepth],[hi[0],lo[1],midDepth])
            for(var x=lo[0];x<=hi[0];x+=25)line([x,lo[1],midDepth],[x,lo[1]+2,midDepth])
            label([0,lo[1]+5,midDepth],"Swimming width: "+guide.dimensions.swimSizeCm[0]+" cm")
            for(var i=0;i<guide.dimensions.objects.length;i++) {
                var o=guide.dimensions.objects[i],b=o.boundsCm
                if(["Blue_tiki","Branching_left","Brain_right"].indexOf(o.id)<0)continue
                var x=o.id==="Branching_left"?b.min[0]-4:b.max[0]+3,z=(b.min[2]+b.max[2])/2
                line([x,b.min[1],z],[x,b.max[1],z])
                line([x-2,b.min[1],z],[x+2,b.min[1],z])
                line([x-2,b.max[1],z],[x+2,b.max[1],z])
                label([x,b.max[1]+5,z],o.name+": "+Math.round(b.size[1])+" cm tall")
            }
        }
    }
    Rectangle {
        x:30;y:24;width:900;height:106;radius:8;color:"#ed092236"
        Text {textFormat:Text.PlainText;x:20;y:14;text:"Scale guide";font.pixelSize:29;color:"#f0f6f9"}
        Text {textFormat:Text.PlainText;x:20;y:57;font.pixelSize:20;color:"#c8dfe9";text:guide.dimensions?
            "Swim area: "+guide.dimensions.swimSizeCm[0]+" W × "+guide.dimensions.swimSizeCm[2]+" D × "+guide.dimensions.swimSizeCm[1]+" H cm  ·  S hide  ·  G compare fish":"Loading dimensions…"}
    }
}
