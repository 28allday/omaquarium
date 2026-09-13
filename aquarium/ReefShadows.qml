pragma ComponentBehavior: Bound
import QtQuick
import QtQuick3D

View3D {
    id: shadows
    required property var metadata
    required property var population
    property var moraySpecification: null
    property real morayTimeMs: 0
    property bool morayVisible: false
    property int onlyFish: -1
    property bool shadowsEnabled: true
    property bool membraneShadows: true
    explicitTextureWidth: 960
    explicitTextureHeight: 540
    function sync(world) {
        if (!world) return
        for (var i=0; i<casters.count; i++) {
            var caster=casters.objectAt(i)
            if (caster) caster.pose(world.fish[i])
        }
    }
    environment: SceneEnvironment {
        backgroundMode: SceneEnvironment.Transparent
        antialiasingMode: SceneEnvironment.NoAA
        tonemapMode: SceneEnvironment.TonemapModeNone
    }
    camera: shadowCamera
    PerspectiveCamera {
        id: shadowCamera
        position: shadows.metadata ? Qt.vector3d(...shadows.metadata.camera.position) : Qt.vector3d(0,182,480)
        rotation: shadows.metadata ? Qt.quaternion(...shadows.metadata.camera.quaternion) : Qt.quaternion(1,0,0,0)
        fieldOfView: shadows.metadata ? shadows.metadata.camera.horizontalFov : 42
        fieldOfViewOrientation: PerspectiveCamera.Horizontal
        clipNear: 1
        clipFar: 2000
    }
    DirectionalLight {
        eulerRotation: Qt.vector3d(-65,-24,0)
        castsShadow: shadows.shadowsEnabled
        shadowFactor: 100
        shadowMapQuality: Light.ShadowMapQualityMedium
        shadowMapFar: 750
        shadowBias: .06
        shadowFilter: 12
    }
    Model {
        source: "depth/meshes/reef_depth_mesh.mesh"
        scale: Qt.vector3d(100,100,100)
        castsShadows: false
        receivesShadows: true
        materials: CustomMaterial {
            shadingMode: CustomMaterial.Shaded
            cullMode: Material.NoCulling
            sourceBlend: CustomMaterial.SrcAlpha
            destinationBlend: CustomMaterial.OneMinusSrcAlpha
            fragmentShader: "shadow-receiver.frag"
        }
    }
    Repeater3D {
        id: casters
        model: shadows.population
        LiveFish {
            id: caster
            required property int index
            required property var modelData
            specification: Object.assign({}, modelData, {source: modelData.source.replace("fish/", "shadow-fish/")})
            visible: shadows.onlyFish === -1 || shadows.onlyFish === index
            Binding {
                target: caster.asset
                property: "shadowAlphaMask"
                value: shadows.membraneShadows
                when: caster.asset !== null
            }
        }
    }
    Loader3D {
        active: shadows.moraySpecification !== null
        sourceComponent: Component {
            LiveMoray {
                specification: shadows.moraySpecification
                timeMs: shadows.morayTimeMs
                visible: shadows.morayVisible
                modelSource: "shadow-fish/zebra-moray-eel/Zebra_moray_eel_low.qml"
            }
        }
    }
}
