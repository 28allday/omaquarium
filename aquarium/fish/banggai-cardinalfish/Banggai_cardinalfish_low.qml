import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node
    property string clip: "Idle"
    property bool animate: true
    property real poseTimeMs: 0

    // Resources
    property url textureData: "maps/textureData.png"
    property url textureData4: "maps/textureData4.png"
    property url textureData6: "maps/textureData6.png"
    property url textureData20: "maps/textureData20.png"
    property url textureData8: "maps/textureData8.png"
    property url textureData18: "maps/textureData18.png"
    property url textureData11: "maps/textureData11.png"
    property url textureData13: "maps/textureData13.png"
    property url textureData15: "maps/textureData15.png"
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
    PrincipledMaterial {
        id: banggai_eye_low_material
        objectName: "Banggai_eye_low"
        baseColorMap: _6_texture
        metalnessMap: _7_texture
        roughnessMap: _7_texture
        roughness: .72
        normalStrength: .28
        specularAmount: .48
        clearcoatAmount: .30
        clearcoatRoughnessAmount: .13
        normalMap: _8_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: banggai_body_low_material
        objectName: "Banggai_body_low"
        baseColorMap: _3_texture
        metalnessMap: _4_texture
        roughnessMap: _4_texture
        roughness: .90
        specularAmount: .38
        normalStrength: .70
        clearcoatAmount: .18
        clearcoatRoughnessAmount: .24
        normalMap: _5_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    CustomMaterial {
        id: banggai_fin_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        sourceBlend: CustomMaterial.SrcAlpha
        destinationBlend: CustomMaterial.OneMinusSrcAlpha
        // Preserve solid body coverage beneath a translucent fin. Reusing
        // SrcAlpha for alpha itself punches holes in the transparent View3D.
        sourceAlphaBlend: CustomMaterial.One
        destinationAlphaBlend: CustomMaterial.OneMinusSrcAlpha
        fragmentShader: "../../fish-fin.frag"
        property TextureInput pigmentMap: TextureInput { texture: _0_texture }
        property TextureInput surfaceMap: TextureInput { texture: _1_texture }
        property TextureInput reliefMap: TextureInput { texture: _2_texture }
    }
    PrincipledMaterial {
        id: mouth_interior_material
        objectName: "Mouth interior"
        baseColor: "#ff090100"
        roughness: 0.6000000238418579
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
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
            caudalUpperTip,
            caudalLowerTip,
            dorsalSecondRear,
            analFin,
            dorsalSecondFront,
            dorsalSecondMid,
            dorsalSecondTip,
            dorsalFirst,
            dorsalFirstMid,
            dorsalFirstTip,
            pectoralL,
            pectoralLTip,
            pelvicL,
            pectoralR,
            pectoralRTip,
            pelvicR
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0108951, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.00142109, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.00331589, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.00805287, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0123162, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.544402, -0.838824, -0.026925, 0, 0.838824, 0.544402, 0.00985085, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.548357, -0.836244, -0.0246963, 0, 0.836244, -0.548357, -0.0133053, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.998933, -0.0461883, -0.00706743, 0, 0.0461883, 0.998933, 0.010817, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.954717, -0.297516, -0.00871891, 0, 0.297516, -0.954717, -0.00919093, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.873862, -0.486173, -0.011139, 0, 0.486173, 0.873862, 0.0016087, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.737625, -0.675211, -0.0177493, 0, 0.675211, 0.737625, -0.00256872, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.464931, -0.885347, -0.0236802, 0, 0.885347, 0.464931, -0.011267, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.93195, -0.362586, -0.00862899, 0, 0.362586, 0.93195, -0.00518704, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.874654, -0.484748, -0.0125125, 0, 0.484748, 0.874654, -0.00693465, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.769108, -0.639118, -0.0154192, 0, 0.639118, 0.769108, -0.00997995, 0, 0, 0, 1),
            Qt.matrix4x4(0.817204, -0.0291129, 0.575613, -0.00593637, 0.575613, 0.0916747, -0.812567, 0.00253194, -0.0291129, 0.995363, 0.0916747, 0.00287692, 0, 0, 0, 1),
            Qt.matrix4x4(0.826661, -0.028603, 0.561973, -0.00601343, 0.561973, 0.0927322, -0.821941, -0.00442143, -0.028603, 0.99528, 0.0927322, 0.00287341, 0, 0, 0, 1),
            Qt.matrix4x4(0.998073, 0.0252595, 0.0566755, -0.00107348, 0.0566755, -0.742939, -0.666956, -0.00430935, 0.0252595, 0.668883, -0.742939, 0.00888754, 0, 0, 0, 1),
            Qt.matrix4x4(0.817204, 0.0291129, -0.575613, 0.00593637, -0.575613, 0.0916747, -0.812567, 0.00253194, 0.0291129, 0.995363, 0.0916747, 0.00287692, 0, 0, 0, 1),
            Qt.matrix4x4(0.826661, 0.028603, -0.561973, 0.00601343, -0.561973, 0.0927322, -0.821941, -0.00442143, 0.028603, 0.99528, 0.0927322, 0.00287341, 0, 0, 0, 1),
            Qt.matrix4x4(0.998073, -0.0252595, -0.0566755, 0.00107348, -0.0566755, -0.742939, -0.666956, -0.00430935, -0.0252595, 0.668883, -0.742939, 0.00888754, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: banggai_Root
        objectName: "Banggai_Root"
        source: "meshes/banggai_Root_mesh.mesh"
        skin: skin
        materials: [
            banggai_fin_low_material,
            banggai_body_low_material,
            banggai_fin_low_material,
            banggai_fin_low_material,
            banggai_fin_low_material,
            banggai_eye_low_material,
            banggai_eye_low_material,
            banggai_body_low_material,
            banggai_body_low_material,
            banggai_body_low_material,
            mouth_interior_material,
            banggai_fin_low_material,
            banggai_fin_low_material,
            banggai_fin_low_material,
            banggai_fin_low_material
        ]
        Node {
            id: banggai_Rig
            objectName: "Banggai_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0108951)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.00947396, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.00473698, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.00473698, 0)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.00426328, 0)
                                    Node {
                                        id: caudalUpperTip
                                        objectName: "CaudalUpperTip"
                                        position: Qt.vector3d(0, 0.015632, 0.00639493)
                                        rotation: Qt.quaternion(0.95886, 0.28388, 0, 0)
                                    }
                                    Node {
                                        id: caudalLowerTip
                                        objectName: "CaudalLowerTip"
                                        position: Qt.vector3d(0, 0.015632, -0.00241586)
                                        rotation: Qt.quaternion(0.958187, -0.286143, 0, 0)
                                    }
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.0299377, 0.0156794)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalSecondRear
                                objectName: "DorsalSecondRear"
                                position: Qt.vector3d(0, 0.00781602, 0.00656026)
                                rotation: Qt.quaternion(0.723252, 0.690584, 0, 0)
                            }
                            Node {
                                id: analFin
                                objectName: "AnalFin"
                                position: Qt.vector3d(0, 0.00805287, -0.00558964)
                                rotation: Qt.quaternion(0.805455, -0.592657, 0, 0)
                            }
                        }
                        Node {
                            id: dorsalSecondFront
                            objectName: "DorsalSecondFront"
                            position: Qt.vector3d(0, 0.00824235, 0.00895182)
                            rotation: Qt.quaternion(0.862025, 0.506866, 0, 0)
                            Node {
                                id: dorsalSecondMid
                                objectName: "DorsalSecondMid"
                                position: Qt.vector3d(0, 0.00672295, 0)
                                rotation: Qt.quaternion(0.99319, -0.116507, 0, 0)
                                Node {
                                    id: dorsalSecondTip
                                    objectName: "DorsalSecondTip"
                                    position: Qt.vector3d(0, 0.00834852, 0)
                                    rotation: Qt.quaternion(0.985074, -0.172133, 0, 0)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                            }
                        }
                    }
                    Node {
                        id: dorsalFirst
                        objectName: "DorsalFirst"
                        position: Qt.vector3d(0, 0.00918974, 0.00992254)
                        rotation: Qt.quaternion(0.825405, 0.564541, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: dorsalFirstMid
                            objectName: "DorsalFirstMid"
                            position: Qt.vector3d(0, 0.00470319, 1.85298e-10)
                            rotation: Qt.quaternion(0.997722, -0.0674654, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: dorsalFirstTip
                                objectName: "DorsalFirstTip"
                                position: Qt.vector3d(0, 0.00449514, -3.49246e-10)
                                rotation: Qt.quaternion(0.995619, -0.0935014, 0, 0)
                            }
                        }
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.00347756, 0.00568438, -0.00326852)
                        rotation: Qt.quaternion(0.951989, 0.048149, 0, -0.302321)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralLTip
                            objectName: "PectoralLTip"
                            position: Qt.vector3d(-1.45519e-11, 0.00705407, 1.49157e-10)
                            rotation: Qt.quaternion(0.999965, 0.000290945, 0.000511515, 0.00828678)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00109115, 0.00710547, -0.00911919)
                        rotation: Qt.quaternion(0.91295, -0.406889, -2.55031e-09, -0.0310398)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.00347756, 0.00568438, -0.00326852)
                        rotation: Qt.quaternion(0.951989, 0.048149, 0, 0.302321)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralRTip
                            objectName: "PectoralRTip"
                            position: Qt.vector3d(1.45519e-11, 0.00705407, 1.49157e-10)
                            rotation: Qt.quaternion(0.999965, 0.000290945, -0.000511515, -0.00828678)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00109115, 0.00710547, -0.00911919)
                        rotation: Qt.quaternion(0.91295, -0.406889, 2.55031e-09, 0.0310398)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0108951, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.00685106, 4.73698e-05)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.00347756, 0.00568438, -0.00326852)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.00347756, 0.00568438, -0.00326852)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00109115, 0.00710547, -0.00911919)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00109115, 0.00710547, -0.00911919)
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0108951) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0, 0.0108951) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.00947396, 0) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.00947396, 0) }
        }
        KeyframeGroup {
            target: dorsalFirst
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.00918974, 0.00992254) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.00918974, 0.00992254) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00347756, 0.00568438, -0.00326852) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00347756, 0.00568438, -0.00326852) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00109115, 0.00710547, -0.00911919) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00109115, 0.00710547, -0.00911919) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00347756, 0.00568438, -0.00326852) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00347756, 0.00568438, -0.00326852) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00109115, 0.00710547, -0.00911919) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00109115, 0.00710547, -0.00911919) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "animations/pelvicR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "animations/pectoralRTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "animations/pectoralRTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "animations/pectoralR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "animations/pelvicL_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "animations/pectoralLTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "animations/pectoralLTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "animations/pectoralL_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFirstTip
            property: "position"
            keyframeSource: "animations/dorsalFirstTip_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalFirstTip
            property: "rotation"
            keyframeSource: "animations/dorsalFirstTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFirstMid
            property: "position"
            keyframeSource: "animations/dorsalFirstMid_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalFirstMid
            property: "rotation"
            keyframeSource: "animations/dorsalFirstMid_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFirst
            property: "rotation"
            keyframeSource: "animations/dorsalFirst_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "position"
            keyframeSource: "animations/caudalLowerTip_position_0.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "rotation"
            keyframeSource: "animations/caudalLowerTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "animations/midBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "animations/rearBody_position_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "animations/rearBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "animations/peduncle_position_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "animations/peduncle_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "animations/caudalFin_position_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "animations/caudalFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "position"
            keyframeSource: "animations/caudalUpperTip_position_0.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "rotation"
            keyframeSource: "animations/caudalUpperTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSecondRear
            property: "position"
            keyframeSource: "animations/dorsalSecondRear_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSecondRear
            property: "rotation"
            keyframeSource: "animations/dorsalSecondRear_rotation_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "animations/analFin_position_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "animations/analFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSecondFront
            property: "position"
            keyframeSource: "animations/dorsalSecondFront_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSecondFront
            property: "rotation"
            keyframeSource: "animations/dorsalSecondFront_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSecondMid
            property: "position"
            keyframeSource: "animations/dorsalSecondMid_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSecondMid
            property: "rotation"
            keyframeSource: "animations/dorsalSecondMid_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSecondTip
            property: "position"
            keyframeSource: "animations/dorsalSecondTip_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSecondTip
            property: "rotation"
            keyframeSource: "animations/dorsalSecondTip_rotation_0.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0108951) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0, 0.0108951) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.00947396, 0) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.00947396, 0) }
        }
        KeyframeGroup {
            target: dorsalFirst
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.00918974, 0.00992254) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.00918974, 0.00992254) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00347756, 0.00568438, -0.00326852) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00347756, 0.00568438, -0.00326852) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00109115, 0.00710547, -0.00911919) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00109115, 0.00710547, -0.00911919) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00347756, 0.00568438, -0.00326852) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00347756, 0.00568438, -0.00326852) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00109115, 0.00710547, -0.00911919) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00109115, 0.00710547, -0.00911919) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "animations/pelvicR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "animations/pectoralRTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "animations/pectoralRTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "animations/pectoralR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "animations/pelvicL_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "animations/pectoralLTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "animations/pectoralLTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "animations/pectoralL_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFirstTip
            property: "position"
            keyframeSource: "animations/dorsalFirstTip_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalFirstTip
            property: "rotation"
            keyframeSource: "animations/dorsalFirstTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFirstMid
            property: "position"
            keyframeSource: "animations/dorsalFirstMid_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalFirstMid
            property: "rotation"
            keyframeSource: "animations/dorsalFirstMid_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFirst
            property: "rotation"
            keyframeSource: "animations/dorsalFirst_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "position"
            keyframeSource: "animations/caudalLowerTip_position_1.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "rotation"
            keyframeSource: "animations/caudalLowerTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "animations/midBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "animations/rearBody_position_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "animations/rearBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "animations/peduncle_position_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "animations/peduncle_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "animations/caudalFin_position_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "animations/caudalFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "position"
            keyframeSource: "animations/caudalUpperTip_position_1.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "rotation"
            keyframeSource: "animations/caudalUpperTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSecondRear
            property: "position"
            keyframeSource: "animations/dorsalSecondRear_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSecondRear
            property: "rotation"
            keyframeSource: "animations/dorsalSecondRear_rotation_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "animations/analFin_position_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "animations/analFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSecondFront
            property: "position"
            keyframeSource: "animations/dorsalSecondFront_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSecondFront
            property: "rotation"
            keyframeSource: "animations/dorsalSecondFront_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSecondMid
            property: "position"
            keyframeSource: "animations/dorsalSecondMid_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSecondMid
            property: "rotation"
            keyframeSource: "animations/dorsalSecondMid_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSecondTip
            property: "position"
            keyframeSource: "animations/dorsalSecondTip_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSecondTip
            property: "rotation"
            keyframeSource: "animations/dorsalSecondTip_rotation_1.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0108951) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0, 0.0108951) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.00947396, 0) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.00947396, 0) }
        }
        KeyframeGroup {
            target: dorsalFirst
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.00918974, 0.00992254) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.00918974, 0.00992254) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00347756, 0.00568438, -0.00326852) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00347756, 0.00568438, -0.00326852) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00109115, 0.00710547, -0.00911919) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00109115, 0.00710547, -0.00911919) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00347756, 0.00568438, -0.00326852) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00347756, 0.00568438, -0.00326852) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00109115, 0.00710547, -0.00911919) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00109115, 0.00710547, -0.00911919) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "animations/pelvicR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "animations/pectoralRTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "animations/pectoralRTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "animations/pectoralR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "animations/pelvicL_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "animations/pectoralLTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "animations/pectoralLTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "animations/pectoralL_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFirstTip
            property: "position"
            keyframeSource: "animations/dorsalFirstTip_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalFirstTip
            property: "rotation"
            keyframeSource: "animations/dorsalFirstTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFirstMid
            property: "position"
            keyframeSource: "animations/dorsalFirstMid_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalFirstMid
            property: "rotation"
            keyframeSource: "animations/dorsalFirstMid_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFirst
            property: "rotation"
            keyframeSource: "animations/dorsalFirst_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "position"
            keyframeSource: "animations/caudalLowerTip_position_2.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "rotation"
            keyframeSource: "animations/caudalLowerTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "animations/midBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "animations/rearBody_position_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "animations/rearBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "animations/peduncle_position_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "animations/peduncle_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "animations/caudalFin_position_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "animations/caudalFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "position"
            keyframeSource: "animations/caudalUpperTip_position_2.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "rotation"
            keyframeSource: "animations/caudalUpperTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSecondRear
            property: "position"
            keyframeSource: "animations/dorsalSecondRear_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSecondRear
            property: "rotation"
            keyframeSource: "animations/dorsalSecondRear_rotation_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "animations/analFin_position_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "animations/analFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSecondFront
            property: "position"
            keyframeSource: "animations/dorsalSecondFront_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSecondFront
            property: "rotation"
            keyframeSource: "animations/dorsalSecondFront_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSecondMid
            property: "position"
            keyframeSource: "animations/dorsalSecondMid_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSecondMid
            property: "rotation"
            keyframeSource: "animations/dorsalSecondMid_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSecondTip
            property: "position"
            keyframeSource: "animations/dorsalSecondTip_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSecondTip
            property: "rotation"
            keyframeSource: "animations/dorsalSecondTip_rotation_2.qad"
        }
    }
}
