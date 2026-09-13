import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node
    property bool shadowAlphaMask: true
    property string clip: "Idle"
    property bool animate: true
    property real poseTimeMs: 0

    // Resources
    property url textureData: "../../fish/royal-gramma/maps/textureData.png"
    property url textureData4: "../../fish/royal-gramma/maps/textureData4.png"
    property url textureData6: "../../fish/royal-gramma/maps/textureData6.png"
    property url textureData20: "../../fish/royal-gramma/maps/textureData20.png"
    property url textureData8: "../../fish/royal-gramma/maps/textureData8.png"
    property url textureData18: "../../fish/royal-gramma/maps/textureData18.png"
    property url textureData11: "../../fish/royal-gramma/maps/textureData11.png"
    property url textureData13: "../../fish/royal-gramma/maps/textureData13.png"
    property url textureData15: "../../fish/royal-gramma/maps/textureData15.png"
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
        id: gramma_eye_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: gramma_body_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: gramma_fin_low_material
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
            dorsalMid,
            analFin,
            dorsalFront,
            pectoralL,
            pectoralLTip,
            pelvicL,
            pectoralR,
            pectoralRTip,
            pelvicR
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0205173, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0045594, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0104866, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0209732, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0287242, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0070453, 0, 0, 1, 0.0209732, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.00994292, 0, 0, 1, 0.0091188, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.893144, -0.449771, -0.0135125, 0, 0.449771, -0.893144, -0.0110625, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0100763, 0, 0, 1, -0.0045594, 0, 0, 0, 1),
            Qt.matrix4x4(0.817924, 0.0472162, 0.573385, -0.00858327, 0.573385, -0.148691, -0.80568, 0.00490751, 0.0472162, 0.987756, -0.148691, 0.0047033, 0, 0, 0, 1),
            Qt.matrix4x4(0.841254, 0.0450512, 0.53876, -0.00864566, 0.53876, -0.152897, -0.828469, -0.00179759, 0.0450512, 0.987215, -0.152897, 0.00473458, 0, 0, 0, 1),
            Qt.matrix4x4(0.990575, 0.0478913, 0.128327, -0.00199977, 0.128327, -0.652061, -0.747227, 0.000312098, 0.0478913, 0.756652, -0.652061, 0.0104365, 0, 0, 0, 1),
            Qt.matrix4x4(0.817924, -0.0472162, -0.573385, 0.00858327, -0.573385, -0.148691, -0.80568, 0.00490751, -0.0472162, 0.987756, -0.148691, 0.0047033, 0, 0, 0, 1),
            Qt.matrix4x4(0.841254, -0.0450512, -0.53876, 0.00864566, -0.53876, -0.152897, -0.828469, -0.00179759, -0.0450512, 0.987215, -0.152897, 0.00473458, 0, 0, 0, 1),
            Qt.matrix4x4(0.990575, -0.0478913, -0.128327, 0.00199977, -0.128327, -0.652061, -0.747227, 0.000312098, -0.0478913, 0.756652, -0.652061, 0.0104365, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: gramma_Root
        objectName: "Gramma_Root"
        source: "../../fish/royal-gramma/meshes/gramma_Root_mesh.mesh"
        skin: skin
        materials: [
            gramma_fin_low_material,
            gramma_body_low_material,
            gramma_fin_low_material,
            gramma_fin_low_material,
            gramma_eye_low_material,
            gramma_eye_low_material,
            gramma_body_low_material,
            gramma_body_low_material,
            gramma_body_low_material,
            gramma_body_low_material,
            gramma_body_low_material,
            mouth_interior_material,
            gramma_fin_low_material,
            gramma_fin_low_material,
            gramma_fin_low_material,
            gramma_fin_low_material
        ]
        Node {
            id: collision_Body_Ellipsoid
            objectName: "COLLISION_Body_Ellipsoid"
        }
        Node {
            id: gramma_Rig
            objectName: "Gramma_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0205173)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.0159579, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.015046, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.0104866, 0)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.00775098, 0)
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.0142253, 0.00866286)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalRear
                                objectName: "DorsalRear"
                                position: Qt.vector3d(0, 0.0104866, 0.0070453)
                                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                        Node {
                            id: dorsalMid
                            objectName: "DorsalMid"
                            position: Qt.vector3d(0, 0.0136782, 0.00994292)
                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                        Node {
                            id: analFin
                            objectName: "AnalFin"
                            position: Qt.vector3d(0, 0.0205173, -0.00709301)
                            rotation: Qt.quaternion(0.851402, -0.524514, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: dorsalFront
                        objectName: "DorsalFront"
                        position: Qt.vector3d(0, 0.0159579, 0.0100763)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.00398451, 0.0109426, -0.00351074)
                        rotation: Qt.quaternion(0.950179, -0.0782438, 3.92062e-09, -0.301725)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralLTip
                            objectName: "PectoralLTip"
                            position: Qt.vector3d(6.1118e-10, 0.00705261, 2.91038e-10)
                            rotation: Qt.quaternion(0.999781, -0.00115731, -0.00208029, 0.0207999)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00144106, 0.0132223, -0.00759748)
                        rotation: Qt.quaternion(0.934673, -0.348818, -9.96416e-10, -0.0686479)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.00398451, 0.0109426, -0.00351074)
                        rotation: Qt.quaternion(0.950179, -0.0782438, -3.92062e-09, 0.301725)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralRTip
                            objectName: "PectoralRTip"
                            position: Qt.vector3d(-6.1118e-10, 0.00705261, 2.91038e-10)
                            rotation: Qt.quaternion(0.999781, -0.00115731, 0.00208029, -0.0207999)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00144106, 0.0132223, -0.00759748)
                        rotation: Qt.quaternion(0.934673, -0.348818, 9.96416e-10, 0.0686479)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0205173, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.00653316, -0.00100307)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.00398451, 0.0109426, -0.00351074)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.00398451, 0.0109426, -0.00351074)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00144106, 0.0132223, -0.00759748)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00144106, 0.0132223, -0.00759748)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                }
            }
        }
    }

    // Animations:
    Timeline {
        id: idle_timeline
        objectName: "Idle"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 4000
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Idle"
        animations: TimelineAnimation {
            duration: 4000
            from: 0
            to: 4000
            running: node.animate && node.clip === "Idle"
            loops: -1
        }
        KeyframeGroup {
            target: root
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0, 0) }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 4000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0205173) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0, 0.0205173) }
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
            Keyframe { frame: 4000; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
        }
        KeyframeGroup {
            target: midBody
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0159579, 0) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0159579, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0159579, 0.0100763) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0159579, 0.0100763) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00398451, 0.0109426, -0.00351074) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00398451, 0.0109426, -0.00351074) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00144106, 0.0132223, -0.00759748) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00144106, 0.0132223, -0.00759748) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00398451, 0.0109426, -0.00351074) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00398451, 0.0109426, -0.00351074) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00144106, 0.0132223, -0.00759748) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00144106, 0.0132223, -0.00759748) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pelvicR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralRTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralRTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralLTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralLTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalFront_rotation_0.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/midBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/rearBody_position_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/rearBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/peduncle_position_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/peduncle_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/caudalFin_position_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/caudalFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalRear_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalRear_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalMid_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalMid_rotation_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/analFin_position_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/analFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralL_rotation_0.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pelvicL_rotation_0.qad"
        }
    }
    Timeline {
        id: swim_timeline
        objectName: "Swim"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 2000
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Swim"
        animations: TimelineAnimation {
            duration: 2000
            from: 0
            to: 2000
            running: node.animate && node.clip === "Swim"
            loops: -1
        }
        KeyframeGroup {
            target: root
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0, 0) }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 2000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0205173) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0, 0.0205173) }
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
            Keyframe { frame: 2000; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
        }
        KeyframeGroup {
            target: midBody
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0159579, 0) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0159579, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0159579, 0.0100763) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0159579, 0.0100763) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00398451, 0.0109426, -0.00351074) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00398451, 0.0109426, -0.00351074) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00144106, 0.0132223, -0.00759748) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00144106, 0.0132223, -0.00759748) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00398451, 0.0109426, -0.00351074) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00398451, 0.0109426, -0.00351074) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00144106, 0.0132223, -0.00759748) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00144106, 0.0132223, -0.00759748) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pelvicR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralRTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralRTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralLTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralLTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalFront_rotation_1.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/midBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/rearBody_position_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/rearBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/peduncle_position_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/peduncle_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/caudalFin_position_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/caudalFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalRear_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalRear_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalMid_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalMid_rotation_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/analFin_position_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/analFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralL_rotation_1.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pelvicL_rotation_1.qad"
        }
    }
    Timeline {
        id: burst_timeline
        objectName: "Burst"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1000
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Burst"
        animations: TimelineAnimation {
            duration: 1000
            from: 0
            to: 1000
            running: node.animate && node.clip === "Burst"
            loops: -1
        }
        KeyframeGroup {
            target: root
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0, 0) }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0205173) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0, 0.0205173) }
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
            Keyframe { frame: 1000; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
        }
        KeyframeGroup {
            target: midBody
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0159579, 0) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0159579, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0159579, 0.0100763) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0159579, 0.0100763) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00398451, 0.0109426, -0.00351074) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00398451, 0.0109426, -0.00351074) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00144106, 0.0132223, -0.00759748) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00144106, 0.0132223, -0.00759748) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00398451, 0.0109426, -0.00351074) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00398451, 0.0109426, -0.00351074) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00144106, 0.0132223, -0.00759748) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00144106, 0.0132223, -0.00759748) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pelvicR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralRTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralRTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralLTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralLTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalFront_rotation_2.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/midBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/rearBody_position_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/rearBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/peduncle_position_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/peduncle_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/caudalFin_position_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/caudalFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalRear_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalRear_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalMid_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/dorsalMid_rotation_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/royal-gramma/animations/analFin_position_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/analFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pectoralL_rotation_2.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/royal-gramma/animations/pelvicL_rotation_2.qad"
        }
    }
}
