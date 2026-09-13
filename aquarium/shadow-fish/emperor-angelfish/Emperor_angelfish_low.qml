import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node
    property bool shadowAlphaMask: true
    property string clip: "Swim"
    property bool animate: true
    property real poseTimeMs: 0

    // Resources
    property url textureData: "../../fish/emperor-angelfish/maps/textureData.png"
    property url textureData4: "../../fish/emperor-angelfish/maps/textureData4.png"
    property url textureData6: "../../fish/emperor-angelfish/maps/textureData6.png"
    property url textureData20: "../../fish/emperor-angelfish/maps/textureData20.png"
    property url textureData8: "../../fish/emperor-angelfish/maps/textureData8.png"
    property url textureData18: "../../fish/emperor-angelfish/maps/textureData18.png"
    property url textureData11: "../../fish/emperor-angelfish/maps/textureData11.png"
    property url textureData13: "../../fish/emperor-angelfish/maps/textureData13.png"
    property url textureData15: "../../fish/emperor-angelfish/maps/textureData15.png"
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
        id: emperor_eye_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: emperor_body_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: emperor_fin_low_material
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
            pectoralLTip,
            pelvicL,
            pectoralR,
            pectoralRTip,
            pelvicR
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0990993, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0528529, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0264265, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0770772, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.116717, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0564944, 0, 0, 1, 0.0704706, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.841091, -0.540894, -0.0720859, 0, 0.540894, -0.841091, -0.0112446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0700469, 0, 0, 1, 0.00660662, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0657066, 0, 0, 1, -0.0484485, 0, 0, 0, 1),
            Qt.matrix4x4(0.829946, 0.0880101, 0.550857, -0.051482, 0.550857, -0.285092, -0.784397, 0.0286872, 0.0880101, 0.954451, -0.285092, 0.0301593, 0, 0, 0, 1),
            Qt.matrix4x4(0.855283, 0.0830542, 0.511462, -0.0515905, 0.511462, -0.293531, -0.807618, -0.00702859, 0.0830542, 0.952335, -0.293531, 0.0305768, 0, 0, 0, 1),
            Qt.matrix4x4(0.998482, 0.00845158, 0.0544249, -0.00972659, 0.0544248, -0.303035, -0.951424, 0.0362375, 0.00845159, 0.952942, -0.303035, 0.0734263, 0, 0, 0, 1),
            Qt.matrix4x4(0.829946, -0.0880101, -0.550857, 0.051482, -0.550857, -0.285092, -0.784397, 0.0286872, -0.0880101, 0.954451, -0.285092, 0.0301593, 0, 0, 0, 1),
            Qt.matrix4x4(0.855283, -0.0830542, -0.511462, 0.0515905, -0.511462, -0.293531, -0.807618, -0.00702859, -0.0830542, 0.952335, -0.293531, 0.0305768, 0, 0, 0, 1),
            Qt.matrix4x4(0.998482, -0.00845158, -0.0544249, 0.00972659, -0.0544248, -0.303035, -0.951424, 0.0362375, -0.00845159, 0.952942, -0.303035, 0.0734263, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: emperor_Root
        objectName: "Emperor_Root"
        source: "../../fish/emperor-angelfish/meshes/emperor_Root_mesh.mesh"
        skin: skin
        materials: [
            emperor_fin_low_material,
            emperor_body_low_material,
            emperor_fin_low_material,
            emperor_fin_low_material,
            emperor_eye_low_material,
            emperor_eye_low_material,
            emperor_body_low_material,
            mouth_interior_material,
            emperor_fin_low_material,
            emperor_fin_low_material,
            emperor_fin_low_material,
            emperor_fin_low_material,
            emperor_body_low_material,
            emperor_body_low_material
        ]
        Node {
            id: collision_Body_Ellipsoid
            objectName: "COLLISION_Body_Ellipsoid"
        }
        Node {
            id: emperor_Rig
            objectName: "Emperor_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0990993)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.0462463, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.0792794, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.0506507, 0)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.0396397, 0)
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.0484485, 0.00550551)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalRear
                                objectName: "DorsalRear"
                                position: Qt.vector3d(0, 0.0440441, 0.0564944)
                                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: analFin
                                objectName: "AnalFin"
                                position: Qt.vector3d(0, 0.0220221, -0.0545486)
                                rotation: Qt.quaternion(0.877751, -0.479117, 0, 0)
                            }
                        }
                        Node {
                            id: dorsalMid
                            objectName: "DorsalMid"
                            position: Qt.vector3d(0, 0.0594596, 0.0700469)
                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: dorsalFront
                        objectName: "DorsalFront"
                        position: Qt.vector3d(0, 0.0506507, 0.0657066)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.0242704, 0.0396397, -0.0160761)
                        rotation: Qt.quaternion(0.944563, -0.150912, 0, -0.291594)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralLTip
                            objectName: "PectoralLTip"
                            position: Qt.vector3d(-2.32831e-10, 0.037958, 4.65661e-10)
                            rotation: Qt.quaternion(0.99972, -0.00234955, -0.00442104, 0.0231316)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00711904, 0.0418419, -0.0589075)
                        rotation: Qt.quaternion(0.987781, -0.153392, 1.88569e-09, -0.027549)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.0242704, 0.0396397, -0.0160761)
                        rotation: Qt.quaternion(0.944563, -0.150912, 0, 0.291594)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralRTip
                            objectName: "PectoralRTip"
                            position: Qt.vector3d(2.32831e-10, 0.037958, 4.65661e-10)
                            rotation: Qt.quaternion(0.99972, -0.00234955, 0.00442104, -0.0231316)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00711904, 0.0418419, -0.0589075)
                        rotation: Qt.quaternion(0.987781, -0.153392, -1.88569e-09, 0.027549)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0990993, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.0357353, -0.00616618)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.0242704, 0.0396397, -0.0160761)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.0242704, 0.0396397, -0.0160761)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00711904, 0.0418419, -0.0589075)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00711904, 0.0418419, -0.0589075)
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
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pelvicR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralRTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralRTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralLTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralLTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalFront_rotation_0.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/midBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/rearBody_position_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/rearBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/peduncle_position_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/peduncle_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/caudalFin_position_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/caudalFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalRear_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalRear_rotation_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/analFin_position_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/analFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalMid_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalMid_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralL_rotation_0.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pelvicL_rotation_0.qad"
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
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pelvicR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralRTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralRTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralLTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralLTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalFront_rotation_1.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/midBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/rearBody_position_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/rearBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/peduncle_position_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/peduncle_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/caudalFin_position_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/caudalFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalRear_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalRear_rotation_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/analFin_position_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/analFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalMid_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalMid_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralL_rotation_1.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pelvicL_rotation_1.qad"
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
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pelvicR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralRTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralRTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralLTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralLTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalFront_rotation_2.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/midBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/rearBody_position_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/rearBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/peduncle_position_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/peduncle_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/caudalFin_position_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/caudalFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalRear_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalRear_rotation_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/analFin_position_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/analFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalMid_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/dorsalMid_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pectoralL_rotation_2.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/emperor-angelfish/animations/pelvicL_rotation_2.qad"
        }
    }
}
