import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node
    property bool shadowAlphaMask: true
    property bool repairSeam: true

    readonly property var rigJoints: skin.joints

    // Resources
    property url textureData: "../../fish/clownfish/maps/textureData.png"
    property url textureData4: "../../fish/clownfish/maps/textureData4.png"
    property url textureData6: "../../fish/clownfish/maps/textureData6.png"
    property url textureData20: "../../fish/clownfish/maps/textureData20.png"
    property url textureData8: "../../fish/clownfish/maps/textureData8.png"
    property url textureData18: "../../fish/clownfish/maps/textureData18.png"
    property url textureData11: "../../fish/clownfish/maps/textureData11.png"
    property url textureData13: "../../fish/clownfish/maps/textureData13.png"
    property url textureData15: "../../fish/clownfish/maps/textureData15.png"
    Texture {
        id: _0_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData4
    }
    Texture {
        id: _8_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData
    }
    Texture {
        id: _7_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData20
    }
    Texture {
        id: _6_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData18
    }
    Texture {
        id: _5_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData15
    }
    Texture {
        id: _4_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData13
    }
    Texture {
        id: _3_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData11
    }
    Texture {
        id: _2_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData8
    }
    Texture {
        id: _1_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData6
    }
    CustomMaterial {
        id: clownfish_eye_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: clownfish_body_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: clownfish_fin_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaquePrePassDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && true
        property TextureInput shadowPigment: TextureInput { texture: _0_texture }
    }
    CustomMaterial {
        id: mouth_interior_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    Skin {
        id: skin
        joints: [
            root,
            chest,
            midBody,
            rearBody,
            peduncle,
            caudalFin,
            dorsalRear,
            analFin,
            dorsalMid,
            dorsalFront,
            pectoralL,
            pelvicL,
            pectoralR,
            pelvicR
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0243673, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.00980294, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.00504151, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0170851, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.023247, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.00943281, 0, 0, 1, 0.0126038, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.887739, -0.460348, -0.010364, 0, 0.460348, -0.887739, -0.00377519, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, -1.19209e-07, -0.0128985, 0, 0, 1, -0.000840252, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, -1.19209e-07, -0.0155484, 0, 0, 1, -0.013164, 0, 0, 0, 1),
            Qt.matrix4x4(0.893598, -0.0154497, 0.448602, -0.0153369, 0.448602, 0.0651374, -0.891355, 0.0162547, -0.0154497, 0.997757, 0.0651374, 0.00212606, 0, 0, 0, 1),
            Qt.matrix4x4(0.958295, 0.110483, 0.263562, -0.00569847, 0.263562, -0.69821, -0.665611, 0.00415639, 0.110483, 0.707316, -0.69821, 0.0199611, 0, 0, 0, 1),
            Qt.matrix4x4(0.893598, 0.0154497, -0.448602, 0.0153369, -0.448602, 0.0651374, -0.891355, 0.0162547, 0.0154497, 0.997757, 0.0651374, 0.00212606, 0, 0, 0, 1),
            Qt.matrix4x4(0.958295, -0.110483, -0.263562, 0.00569847, -0.263562, -0.69821, -0.665611, 0.00415639, -0.110483, 0.707316, -0.69821, 0.0199611, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: clownfish_Root
        objectName: "Clownfish_Root"
        source: "../../fish/clownfish/meshes/clownfish_Root_mesh.mesh"
        skin: skin
        materials: [
            clownfish_fin_low_material,
            clownfish_body_low_material,
            clownfish_fin_low_material,
            clownfish_fin_low_material,
            clownfish_eye_low_material,
            clownfish_eye_low_material,
            clownfish_body_low_material,
            mouth_interior_material,
            clownfish_fin_low_material,
            clownfish_fin_low_material,
            clownfish_fin_low_material,
            clownfish_fin_low_material
        ]
        Node {
            id: clownfish_Rig
            objectName: "Clownfish_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0243673)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.0145644, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.0148445, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.0120436, 0)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.00616185, 0)
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.016525, 0.00145644)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalRear
                                objectName: "DorsalRear"
                                position: Qt.vector3d(0, 0.00756227, 0.00943281)
                                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: analFin
                                objectName: "AnalFin"
                                position: Qt.vector3d(0, 0.00308093, -0.00746265)
                                rotation: Qt.quaternion(0.854502, -0.519448, 0, 0)
                            }
                        }
                        Node {
                            id: dorsalMid
                            objectName: "DorsalMid"
                            position: Qt.vector3d(0, 0.00896269, 0.0128985)
                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: dorsalFront
                        objectName: "DorsalFront"
                        position: Qt.vector3d(0, 0.0112034, 0.0155484)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.00644596, 0.00313694, -0.00341703)
                        rotation: Qt.quaternion(0.972459, 0.0334911, -9.57698e-10, -0.230654)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00215998, 0.00616185, -0.0105872)
                        rotation: Qt.quaternion(0.912582, -0.382547, -6.12322e-09, -0.144405)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.00644596, 0.00313694, -0.00341703)
                        rotation: Qt.quaternion(0.972459, 0.0334911, 9.57698e-10, 0.230654)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00215998, 0.00616185, -0.0105872)
                        rotation: Qt.quaternion(0.912582, -0.382547, 6.12322e-09, 0.144405)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0243673, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.0157407, -0.00112034)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.00644596, 0.00313694, -0.00341703)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.00644596, 0.00313694, -0.00341703)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00215998, 0.00616185, -0.0105872)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00215998, 0.00616185, -0.0105872)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                }
            }
        }
        Node {
            id: collision_Body_Ellipsoid
            objectName: "COLLISION_Body_Ellipsoid"
        }
    }

    // Animations:
    Timeline {
        id: idle_timeline
        objectName: "Idle"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 3000
        currentFrame: 0
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pelvicR_rotation_0.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/midBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/dorsalMid_rotation_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/rearBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/peduncle_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/caudalFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/dorsalRear_rotation_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/analFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/dorsalFront_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pectoralL_rotation_0.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pelvicL_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pectoralR_rotation_0.qad"
        }
    }
    Timeline {
        id: swim_timeline
        objectName: "Swim"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1000
        currentFrame: 0
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pelvicR_rotation_1.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/midBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/dorsalMid_rotation_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/rearBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/peduncle_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/caudalFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/dorsalRear_rotation_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/analFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/dorsalFront_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pectoralL_rotation_1.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pelvicL_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pectoralR_rotation_1.qad"
        }
    }
    Timeline {
        id: burst_timeline
        objectName: "Burst"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 667
        currentFrame: 0
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pelvicR_rotation_2.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/midBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/dorsalMid_rotation_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/rearBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/peduncle_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/caudalFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/dorsalRear_rotation_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/analFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/dorsalFront_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pectoralL_rotation_2.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pelvicL_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/clownfish/animations/pectoralR_rotation_2.qad"
        }
    }

    // An exported mapping of Timelines (--manualAnimations)
    property var timelineMap: {
        "Idle": idle_timeline,
        "Swim": swim_timeline,
        "Burst": burst_timeline,
    }
    // A simple list of Timelines (--manualAnimations)
    property var timelineList: [
        idle_timeline,
        swim_timeline,
        burst_timeline,
    ]
}
