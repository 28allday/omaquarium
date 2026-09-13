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
    property url textureData: "../../fish/copperband-butterflyfish/maps/textureData.png"
    property url textureData4: "../../fish/copperband-butterflyfish/maps/textureData4.png"
    property url textureData6: "../../fish/copperband-butterflyfish/maps/textureData6.png"
    property url textureData20: "../../fish/copperband-butterflyfish/maps/textureData20.png"
    property url textureData8: "../../fish/copperband-butterflyfish/maps/textureData8.png"
    property url textureData18: "../../fish/copperband-butterflyfish/maps/textureData18.png"
    property url textureData11: "../../fish/copperband-butterflyfish/maps/textureData11.png"
    property url textureData13: "../../fish/copperband-butterflyfish/maps/textureData13.png"
    property url textureData15: "../../fish/copperband-butterflyfish/maps/textureData15.png"
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
        id: copperband_eye_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: copperband_body_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: copperband_fin_low_material
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
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0470305, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0156768, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.025653, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0456054, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0577193, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0203785, 0, 0, 1, 0.0484557, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, -1.19209e-07, -0.0347741, 0, 0, 1, 0.0199523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.830501, -0.557018, -0.049199, 0, 0.557018, -0.830501, -0.00990304, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, -1.19209e-07, -0.0404633, 0, 0, 1, -0.00356292, 0, 0, 0, 1),
            Qt.matrix4x4(0.770217, 0.0996645, 0.629947, -0.019892, 0.629947, -0.273229, -0.726989, 0.0120082, 0.0996645, 0.956772, -0.273229, 0.0192052, 0, 0, 0, 1),
            Qt.matrix4x4(0.793779, 0.0966123, 0.600484, -0.020096, 0.600485, -0.28132, -0.748517, -0.00910365, 0.0966123, 0.954738, -0.28132, 0.0193126, 0, 0, 0, 1),
            Qt.matrix4x4(0.996678, 0.0233512, 0.078023, -0.00265386, 0.078023, -0.548452, -0.832534, -0.00112877, 0.0233512, 0.835856, -0.548452, 0.0358963, 0, 0, 0, 1),
            Qt.matrix4x4(0.770217, -0.0996645, -0.629947, 0.019892, -0.629947, -0.273229, -0.726989, 0.0120082, -0.0996645, 0.956772, -0.273229, 0.0192052, 0, 0, 0, 1),
            Qt.matrix4x4(0.793779, -0.0966123, -0.600484, 0.020096, -0.600485, -0.28132, -0.748517, -0.00910365, -0.0966123, 0.954738, -0.28132, 0.0193126, 0, 0, 0, 1),
            Qt.matrix4x4(0.996678, -0.0233512, -0.078023, 0.00265386, -0.078023, -0.548452, -0.832534, -0.00112877, -0.0233512, 0.835856, -0.548452, 0.0358963, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: copperband_Root
        objectName: "Copperband_Root"
        source: "../../fish/copperband-butterflyfish/meshes/copperband_Root_mesh.mesh"
        skin: skin
        materials: [
            copperband_fin_low_material,
            copperband_body_low_material,
            copperband_fin_low_material,
            copperband_fin_low_material,
            copperband_eye_low_material,
            copperband_eye_low_material,
            copperband_body_low_material,
            mouth_interior_material,
            copperband_fin_low_material,
            copperband_fin_low_material,
            copperband_fin_low_material,
            copperband_fin_low_material
        ]
        Node {
            id: collision_Body_Ellipsoid
            objectName: "COLLISION_Body_Ellipsoid"
        }
        Node {
            id: copperband_Rig
            objectName: "Copperband_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0470305)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.0313537, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.0413299, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.0199523, 0)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.0121139, 0)
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.038052, -0.000712584)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalRear
                                objectName: "DorsalRear"
                                position: Qt.vector3d(0, 0.0228027, 0.0203785)
                                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                        Node {
                            id: dorsalMid
                            objectName: "DorsalMid"
                            position: Qt.vector3d(0, 0.0356292, 0.0347741)
                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                        Node {
                            id: analFin
                            objectName: "AnalFin"
                            position: Qt.vector3d(0, 0.051306, -0.0353436)
                            rotation: Qt.quaternion(0.882331, -0.470628, 0, 0)
                        }
                    }
                    Node {
                        id: dorsalFront
                        objectName: "DorsalFront"
                        position: Qt.vector3d(0, 0.0434676, 0.0404633)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.00584254, 0.0205224, -0.0131115)
                        rotation: Qt.quaternion(0.929244, -0.147017, 0, -0.338957)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralLTip
                            objectName: "PectoralLTip"
                            position: Qt.vector3d(-1.97906e-09, 0.0217637, 9.31323e-10)
                            rotation: Qt.quaternion(0.999818, -0.00232814, -0.00378282, 0.0185423)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00189489, 0.0280758, -0.0305612)
                        rotation: Qt.quaternion(0.957218, -0.286482, 9.72947e-10, -0.0407551)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.00584254, 0.0205224, -0.0131115)
                        rotation: Qt.quaternion(0.929244, -0.147017, 0, 0.338957)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralRTip
                            objectName: "PectoralRTip"
                            position: Qt.vector3d(1.97906e-09, 0.0217637, 9.31323e-10)
                            rotation: Qt.quaternion(0.999818, -0.00232814, 0.00378282, -0.0185423)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00189489, 0.0280758, -0.0305612)
                        rotation: Qt.quaternion(0.957218, -0.286482, -9.72947e-10, 0.0407551)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0470305, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.0271982, -0.0115439)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.00584254, 0.0205224, -0.0131115)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.00584254, 0.0205224, -0.0131115)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00189489, 0.0280758, -0.0305612)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00189489, 0.0280758, -0.0305612)
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0470305) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0, 0.0470305) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0313537, 0) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0313537, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0434676, 0.0404633) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0434676, 0.0404633) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00584254, 0.0205224, -0.0131115) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00584254, 0.0205224, -0.0131115) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00189489, 0.0280758, -0.0305612) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00189489, 0.0280758, -0.0305612) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00584254, 0.0205224, -0.0131115) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00584254, 0.0205224, -0.0131115) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00189489, 0.0280758, -0.0305612) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00189489, 0.0280758, -0.0305612) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pelvicR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralRTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralRTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralLTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralLTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalFront_rotation_0.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/midBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/rearBody_position_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/rearBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/peduncle_position_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/peduncle_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/caudalFin_position_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/caudalFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalRear_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalRear_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalMid_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalMid_rotation_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/analFin_position_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/analFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralL_rotation_0.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pelvicL_rotation_0.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0470305) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0, 0.0470305) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0313537, 0) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0313537, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0434676, 0.0404633) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0434676, 0.0404633) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00584254, 0.0205224, -0.0131115) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00584254, 0.0205224, -0.0131115) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00189489, 0.0280758, -0.0305612) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00189489, 0.0280758, -0.0305612) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00584254, 0.0205224, -0.0131115) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00584254, 0.0205224, -0.0131115) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00189489, 0.0280758, -0.0305612) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00189489, 0.0280758, -0.0305612) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pelvicR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralRTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralRTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralLTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralLTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalFront_rotation_1.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/midBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/rearBody_position_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/rearBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/peduncle_position_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/peduncle_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/caudalFin_position_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/caudalFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalRear_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalRear_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalMid_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalMid_rotation_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/analFin_position_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/analFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralL_rotation_1.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pelvicL_rotation_1.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0470305) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0, 0.0470305) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0313537, 0) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0313537, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0434676, 0.0404633) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0434676, 0.0404633) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00584254, 0.0205224, -0.0131115) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00584254, 0.0205224, -0.0131115) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00189489, 0.0280758, -0.0305612) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00189489, 0.0280758, -0.0305612) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00584254, 0.0205224, -0.0131115) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00584254, 0.0205224, -0.0131115) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00189489, 0.0280758, -0.0305612) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00189489, 0.0280758, -0.0305612) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pelvicR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralRTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralRTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralLTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralLTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalFront_rotation_2.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/midBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/rearBody_position_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/rearBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/peduncle_position_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/peduncle_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/caudalFin_position_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/caudalFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalRear_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalRear_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalMid_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/dorsalMid_rotation_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/analFin_position_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/analFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pectoralL_rotation_2.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/copperband-butterflyfish/animations/pelvicL_rotation_2.qad"
        }
    }
}
