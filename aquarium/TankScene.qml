pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import QtQuick3D
import Quickshell
import Quickshell.Io
import "Swimming.js" as Swimming
import "Bubbles.js" as Bubbles

Item {
    id: study
    width:1920; height:1080; anchors.centerIn:parent
    scale:Math.min(parent.width/width,parent.height/height)
    property var world: null
    property var water: null
    property bool bubblesEnabled: true
    property bool motesEnabled: true
    property var metadata: null
    property var field: null
    property var population: []
    property var originalPopulation: []
    property int fishCount: 20
    property real fishSize: 1
    property real speed: 1
    property real renderScale: 1
    property int fps: 60
    property string lighting: "daylight"
    property int seedToken: 0
    property int currentSeed: Date.now() % 2147483647
    property real pendingSeconds: 0
    property bool bitMode: false
    property var bitPalette: ["#172f24", "#3d6240", "#819c48", "#c2d178"]
    onBitModeChanged: { if (!bitMode) sync() }
    readonly property real worldTime: world ? plantTimeMs / 1000 : 0
    onFishCountChanged: rebuildPopulation()
    onFishSizeChanged: rebuildPopulation()
    onSeedTokenChanged: { currentSeed = Date.now() % 2147483647; reset(currentSeed) }
    onRunningChanged: pendingSeconds = 0
    onBubblesEnabledChanged: sync()
    function rebuildPopulation() {
        if (!originalPopulation.length) return
        var next = []
        for (var i = 0; i < fishCount; i++) {
            var spec = Object.assign({}, originalPopulation[i % originalPopulation.length])
            spec.scale *= fishSize
            spec.radius *= fishSize
            spec.lengthCm *= fishSize
            if (spec.pathRadius) spec.pathRadius *= fishSize
            if (spec.bodyOffsets) spec.bodyOffsets = spec.bodyOffsets.map(function(x) { return x * study.fishSize })
            next.push(spec)
        }
        world = null
        population = next
        reset(currentSeed)
    }
    function report() {
        return { loading: !world, time: worldTime, running: running,
            fish: population.length, species: population.map(function(f) { return f.species }),
            size: fishSize, speed: speed, qualityScale: renderScale, bitMode: bitMode, bitPalette: bitPalette,
            pixelScene: pixelScene.report(),
            bubbles: bubblesEnabled, particles: motesEnabled, lighting: lighting,
            frames: frames, fps: view.renderStats.fps,
            moray: caveMoray.report(), graphicsApi: study.GraphicsInfo.api }
    }
    // Capture the complete composition, including the optional pixel scene.
    function capture(path) { study.parent.grabToImage(function(result) { result.saveToFile(path) }) }
    property var catalogue: []
    property var dimensions: null
    property int reviewMode: 0
    property bool running: true
    property bool depthEnabled: true
    property bool realisticShadows: true
    property real simulationMs: 0
    property real simulationPeakMs: 0
    property int frames: 0
    property int onlyFish: -1
    property int recordingFrame: 0
    property int recordingCount: 0
    property real morayReviewTime: -1
    property real plantTimeMs: 0
    property string recordingPrefix: ""
    function sync() {
        if(!world) return
        plantTimeMs=world.time*1000
        if (study.bitMode) return
        reefShadows.sync(world)
        for(var i=0;i<animals.count;i++) {
            var animal=animals.objectAt(i) as LiveFish
            if(animal) animal.pose(world.fish[i])
        }
        for(var j=0;j<bubbleModels.count;j++) {
            var model=bubbleModels.objectAt(j) as LiveBubble
            var particle=water&&water.particles[j]
            if(!model)continue
            model.visible=bubblesEnabled&&!!particle
            if(!particle)continue
            model.position=Qt.vector3d(...particle.p)
            model.scale=Qt.vector3d(particle.scale,particle.scale,particle.scale)
            model.fade=particle.fade
        }
    }
    function reset(seed) {
        if(!field||!metadata||!population.length)return
        world=Swimming.create(field,seed,population)
        water=Bubbles.create(seed,metadata.tiki)
        sync()
    }
    function advance(seconds) {
        if(!world)return
        Swimming.advance(world,seconds)
        Bubbles.advance(water,seconds,bubblesEnabled)
        sync()
    }
    FileView {
        path:Qt.resolvedUrl("bake/scene.json")
        onLoaded:{study.metadata=JSON.parse(text());study.reset(study.currentSeed)}
    }
    FileView {
        path:Qt.resolvedUrl("bake/navigation.json")
        onLoaded: {study.field=JSON.parse(text());study.reset(study.currentSeed)}
    }
    FileView {
        path:Qt.resolvedUrl("population.json")
        onLoaded: {study.originalPopulation=JSON.parse(text());study.rebuildPopulation()}
    }
    FileView {path:Qt.resolvedUrl("catalogue.json");onLoaded:study.catalogue=JSON.parse(text())}
    FileView {path:Qt.resolvedUrl("scale-guide.json");onLoaded:study.dimensions=JSON.parse(text())}
    Image {
        anchors.fill:parent
        source:study.metadata&&study.metadata.backdrop?"bake/"+study.metadata.backdrop.file:""
        visible:source.toString().length>0
        fillMode:Image.PreserveAspectCrop
        smooth:true
        layer.enabled: true
        layer.effect: MultiEffect {
            saturation: -.20
            brightness: -.065
            contrast: -.045
            colorization: .055
            colorizationColor: "#458b94"
            blurEnabled: true
            blurMax: 8
            blur: .35
            autoPaddingEnabled: false
        }
    }
    Image { anchors.fill:parent; source:"bake/reef.png"; smooth:true }
    ReefShadows {
        id: reefShadows
        visible: !study.bitMode
        anchors.fill: parent
        metadata: study.metadata
        population: study.population
        onlyFish: study.onlyFish
        shadowsEnabled: study.realisticShadows
        moraySpecification: caveMoray.specification
        morayTimeMs: caveMoray.timeMs
        morayVisible: caveMoray.visible
    }
    View3D {
        id: view
        visible: !study.bitMode
        anchors.fill:parent
        explicitTextureWidth:Math.round(1920*study.renderScale); explicitTextureHeight:Math.round(1080*study.renderScale)
        camera:camera
        environment:SceneEnvironment {
            backgroundMode:SceneEnvironment.Transparent
            antialiasingMode:SceneEnvironment.MSAA
            antialiasingQuality:SceneEnvironment.High
            tonemapMode:SceneEnvironment.TonemapModeFilmic
            lightProbe:Texture {source:"bake/reef-probe.hdr";mappingMode:Texture.LightProbe}
            probeExposure:1.1
        }
        PerspectiveCamera {
            id:camera
            position:study.metadata?Qt.vector3d(...study.metadata.camera.position):Qt.vector3d(0,182,480)
            rotation:study.metadata?Qt.quaternion(...study.metadata.camera.quaternion):Qt.quaternion(1,0,0,0)
            fieldOfView:study.metadata?study.metadata.camera.horizontalFov:42
            fieldOfViewOrientation:PerspectiveCamera.Horizontal
            clipNear:1; clipFar:2000
        }
        DirectionalLight {
            eulerRotation:Qt.vector3d(-65,-24,0)
            color:"#e1eeff"; brightness:1.05
            ambientColor:"#4a6680"
            castsShadow: study.realisticShadows
            shadowFactor: 65
            shadowMapQuality: Light.ShadowMapQualityHigh
            shadowMapFar: 750
            shadowBias: .06
            shadowFilter: 8
        }
        DirectionalLight { eulerRotation:Qt.vector3d(-12,145,0); color:"#559edd"; brightness:.36 }
        Model {
            visible:study.depthEnabled
            source:"depth/meshes/reef_depth_mesh.mesh"
            scale:Qt.vector3d(100,100,100)
            materials:CustomMaterial {
                shadingMode:CustomMaterial.Unshaded
                cullMode:Material.NoCulling
                depthDrawMode:Material.AlwaysDepthDraw
                vertexShader:"depth.vert"
                fragmentShader:"depth.frag"
            }
        }
        Repeater3D {
            id:animals
            model:study.population
            LiveFish { required property int index; required property var modelData; specification:modelData; visible:study.onlyFish===-1 || study.onlyFish===index }
        }
        Repeater3D {
            model:study.metadata&&study.metadata.foliage?study.metadata.foliage:[]
            LiveFoliage {
                required property var modelData
                specification:modelData
                timeMs:study.plantTimeMs
            }
        }
        Repeater3D {
            model:study.metadata&&study.metadata.clam?[study.metadata.clam]:[]
            LiveClam {
                required property var modelData
                specification:modelData
                timeMs:study.plantTimeMs
            }
        }
        LiveMoray {
            id:caveMoray
            specification:{"entrance":[27,8,-3],"direction":[-0.49240387650610395,0.17364817766693033,0.8528685319524433],"modelScale":[160,160,120],"lengthCm":72,"mouthOffsetCm":36,"retractedCm":-3,"emergedCm":15,"cycleSeconds":42,"description":"Fixed resident in the lower rock cave beside the brain coral and gravel, following the chosen location and cave/colour reference. Faces outward; short emerge/retreat motion without free swimming."}
            timeMs:study.morayReviewTime>=0?study.morayReviewTime*1000:study.plantTimeMs
        }
        Repeater3D {
            id:bubbleModels
            model:Bubbles.CAPACITY
            LiveBubble {}
        }
        WaterMotes {
            id:waterMotes
            visible:study.motesEnabled
            timeSeconds:study.plantTimeMs/1000
        }
    }
    ScaleGuide {anchors.fill:parent;viewport:view;dimensions:study.dimensions;visible:study.reviewMode===1}
    Loader {
        id:lineup;anchors.fill:parent;active:study.reviewMode===2
        sourceComponent:Component {ScaleLineup {catalogue:study.catalogue}}
    }
    FrameAnimation {
        running:study.running && study.world!==null && study.reviewMode!==2
        onTriggered: {
            var start=Date.now()
            study.pendingSeconds += Math.min(frameTime, .1)
            if (study.pendingSeconds + .0001 < 1 / study.fps) return
            var elapsed = study.pendingSeconds
            study.pendingSeconds = 0
            study.advance(elapsed * study.speed)
            study.simulationMs+=(Date.now()-start-study.simulationMs)*.04
            study.simulationPeakMs=Math.max(study.simulationPeakMs,Date.now()-start)
            study.frames++
        }
    }
    Rectangle {
        anchors.fill: parent
        color: study.lighting === "dusk" ? "#593412" : "#071933"
        opacity: study.lighting === "daylight" ? 0 : study.lighting === "dusk" ? .12 : .42
        visible: !study.bitMode && opacity > 0
    }
    BitScene {
        id: pixelScene
        anchors.fill: parent
        visible: study.bitMode
        palette: study.bitPalette
        population: study.population
        time: study.worldTime
        fishSize: study.fishSize
        seed: study.currentSeed
        bubbles: study.bubblesEnabled
        particles: study.motesEnabled
        lighting: study.lighting
    }
}
