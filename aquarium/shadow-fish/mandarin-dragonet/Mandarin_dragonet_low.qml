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
    property url textureData: "../../fish/mandarin-dragonet/maps/textureData.png"
    property url textureData4: "../../fish/mandarin-dragonet/maps/textureData4.png"
    property url textureData6: "../../fish/mandarin-dragonet/maps/textureData6.png"
    property url textureData20: "../../fish/mandarin-dragonet/maps/textureData20.png"
    property url textureData8: "../../fish/mandarin-dragonet/maps/textureData8.png"
    property url textureData18: "../../fish/mandarin-dragonet/maps/textureData18.png"
    property url textureData11: "../../fish/mandarin-dragonet/maps/textureData11.png"
    property url textureData13: "../../fish/mandarin-dragonet/maps/textureData13.png"
    property url textureData15: "../../fish/mandarin-dragonet/maps/textureData15.png"
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
        id: mandarin_eye_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: mandarin_body_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: mandarin_fin_low_material
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
            dorsalFront,
            dorsalMid,
            dorsalAnterior,
            pectoralL,
            pectoralLTip,
            pelvicL,
            pectoralR,
            pectoralRTip,
            pelvicR
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.020629, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0120336, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.00042977, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.00816564, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.015042, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, -1.19209e-07, -0.006165, 0, 0, 1, 0.00945495, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.943828, -0.330436, -0.00584031, 0, 0.330436, -0.943828, -0.00478552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, -1.19209e-07, -0.00843327, 0, 0, 1, -0.00365305, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, -1.19209e-07, -0.00782994, 0, 0, 1, 0.00193397, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.00726929, 0, 0, 1, -0.011174, 0, 0, 0, 1),
            Qt.matrix4x4(0.724294, 0.193773, 0.661703, -0.0123199, 0.661703, -0.465061, -0.588105, 0.00344324, 0.193773, 0.863812, -0.465061, 0.00491595, 0, 0, 0, 1),
            Qt.matrix4x4(0.808592, 0.17483, 0.561794, -0.0121469, 0.561794, -0.513139, -0.648903, 3.29367e-05, 0.17483, 0.840311, -0.513139, 0.00548991, 0, 0, 0, 1),
            Qt.matrix4x4(0.817423, 0.254696, 0.516672, -0.00665319, 0.516672, -0.72076, -0.462121, 0.000777934, 0.254696, 0.644698, -0.72076, 0.0119643, 0, 0, 0, 1),
            Qt.matrix4x4(0.724294, -0.193773, -0.661703, 0.0123199, -0.661703, -0.465061, -0.588105, 0.00344324, -0.193773, 0.863812, -0.465061, 0.00491595, 0, 0, 0, 1),
            Qt.matrix4x4(0.808592, -0.17483, -0.561794, 0.0121469, -0.561794, -0.513139, -0.648903, 3.29367e-05, -0.17483, 0.840311, -0.513139, 0.00548991, 0, 0, 0, 1),
            Qt.matrix4x4(0.817423, -0.254696, -0.516672, 0.00665319, -0.516672, -0.72076, -0.462121, 0.000777934, -0.254696, 0.644698, -0.72076, 0.0119643, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: mandarin_Root
        objectName: "Mandarin_Root"
        source: "../../fish/mandarin-dragonet/meshes/mandarin_Root_mesh.mesh"
        skin: skin
        materials: [
            mandarin_fin_low_material,
            mandarin_body_low_material,
            mandarin_fin_low_material,
            mandarin_fin_low_material,
            mandarin_fin_low_material,
            mandarin_eye_low_material,
            mandarin_eye_low_material,
            mandarin_body_low_material,
            mouth_interior_material,
            mandarin_fin_low_material,
            mandarin_fin_low_material,
            mandarin_fin_low_material,
            mandarin_fin_low_material
        ]
        Node {
            id: collision_Body_Ellipsoid
            objectName: "COLLISION_Body_Ellipsoid"
        }
        Node {
            id: mandarin_Rig
            objectName: "Mandarin_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.020629)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.00859541, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.0116038, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.00859541, 0)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.00687633, 0)
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.0171908, 0.00042977)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalRear
                                objectName: "DorsalRear"
                                position: Qt.vector3d(0, 0.00988472, 0.006165)
                                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: analFin
                                objectName: "AnalFin"
                                position: Qt.vector3d(0, 0.00687633, -0.00393094)
                                rotation: Qt.quaternion(0.815609, -0.578604, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                        Node {
                            id: dorsalFront
                            objectName: "DorsalFront"
                            position: Qt.vector3d(0, 0.00838052, 0.00843327)
                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                        Node {
                            id: dorsalMid
                            objectName: "DorsalMid"
                            position: Qt.vector3d(0, 0.0139675, 0.00782994)
                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: dorsalAnterior
                        objectName: "DorsalAnterior"
                        position: Qt.vector3d(0, 0.00945495, 0.00726929)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.00569228, 0.00816564, -0.000257862)
                        rotation: Qt.quaternion(0.891096, -0.260949, -8.36114e-09, -0.371286)
                        Node {
                            id: pectoralLTip
                            objectName: "PectoralLTip"
                            position: Qt.vector3d(0, 0.00476244, -1.16415e-10)
                            rotation: Qt.quaternion(0.997706, -0.0148553, -0.0241861, 0.061455)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00198928, 0.00820862, -0.00545808)
                        rotation: Qt.quaternion(0.855021, -0.421487, 8.71392e-09, -0.30214)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.00569228, 0.00816564, -0.000257862)
                        rotation: Qt.quaternion(0.891096, -0.260949, 8.36114e-09, 0.371286)
                        Node {
                            id: pectoralRTip
                            objectName: "PectoralRTip"
                            position: Qt.vector3d(0, 0.00476244, -1.16415e-10)
                            rotation: Qt.quaternion(0.997706, -0.0148553, 0.0241861, -0.061455)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00198928, 0.00820862, -0.00545808)
                        rotation: Qt.quaternion(0.855021, -0.421487, -8.71392e-09, 0.30214)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.020629, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.00713824, -0.00141824)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.00569228, 0.00816564, -0.000257862)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.00569228, 0.00816564, -0.000257862)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00198928, 0.00820862, -0.00545808)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00198928, 0.00820862, -0.00545808)
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
        endFrame: 3000
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Idle"
        animations: TimelineAnimation {
            duration: 3000
            from: 0
            to: 3000
            running: node.animate && node.clip === "Idle"
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pelvicR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralRTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralRTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pelvicL_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralLTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralLTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalAnterior
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalAnterior_rotation_0.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/midBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/rearBody_position_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/rearBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/peduncle_position_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/peduncle_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/caudalFin_position_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/caudalFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalRear_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalRear_rotation_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/analFin_position_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/analFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalFront_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalFront_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalMid_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalMid_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralL_rotation_0.qad"
        }
    }
    Timeline {
        id: swim_timeline
        objectName: "Swim"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1000
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Swim"
        animations: TimelineAnimation {
            duration: 1000
            from: 0
            to: 1000
            running: node.animate && node.clip === "Swim"
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pelvicR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralRTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralRTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pelvicL_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralLTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralLTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalAnterior
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalAnterior_rotation_1.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/midBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/rearBody_position_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/rearBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/peduncle_position_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/peduncle_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/caudalFin_position_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/caudalFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalRear_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalRear_rotation_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/analFin_position_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/analFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalFront_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalFront_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalMid_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalMid_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralL_rotation_1.qad"
        }
    }
    Timeline {
        id: burst_timeline
        objectName: "Burst"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 667
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Burst"
        animations: TimelineAnimation {
            duration: 667
            from: 0
            to: 667
            running: node.animate && node.clip === "Burst"
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pelvicR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralRTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralRTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pelvicL_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralLTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralLTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalAnterior
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalAnterior_rotation_2.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/midBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/rearBody_position_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/rearBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/peduncle_position_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/peduncle_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/caudalFin_position_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/caudalFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalRear_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalRear_rotation_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/analFin_position_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/analFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalFront_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalFront_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalMid_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/dorsalMid_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/mandarin-dragonet/animations/pectoralL_rotation_2.qad"
        }
    }
}
