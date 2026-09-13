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
        id: firefish_eye_low_material
        objectName: "Firefish_eye_low"
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
        id: firefish_body_low_material
        objectName: "Firefish_body_low"
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
        id: firefish_fin_low_material
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
            dorsalSecondRear,
            dorsalSecondFront,
            analFin,
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
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.19209e-07, -1, 0.0226593, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.19209e-07, -1, -0.000894444, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.19209e-07, -1, -0.0101371, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.19209e-07, -1, -0.0235538, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.19209e-07, -1, -0.0348834, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, -1.19209e-07, -0.00143112, 0, 2.02408e-08, 1, 0.0250445, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, -1.19209e-07, -0.00583433, 0, -7.64917e-09, 1, 0.00655927, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.937892, -0.346926, -0.0119236, 0, 0.346926, -0.937892, -0.0140272, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.981163, -0.193182, -0.00651787, 0, 0.193182, 0.981163, -0.00918401, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.851258, -0.524748, -0.0138722, 0, 0.524748, 0.851258, -0.0149958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.710328, -0.703871, -0.0200778, 0, 0.703871, 0.710328, -0.0200632, 0, 0, 0, 1),
            Qt.matrix4x4(0.851639, 0.0227428, 0.523635, -0.0110291, 0.523635, -0.0802699, -0.848153, 0.0106396, 0.0227428, 0.996514, -0.08027, 0.00134809, 0, 0, 0, 1),
            Qt.matrix4x4(0.864335, 0.0219965, 0.502436, -0.0109456, 0.502436, -0.0814638, -0.860768, 0.00344919, 0.0219965, 0.996434, -0.0814639, 0.00136401, 0, 0, 0, 1),
            Qt.matrix4x4(0.995541, 0.0390138, 0.0858824, -0.00254616, 0.0858824, -0.751445, -0.654182, 0.00557112, 0.0390138, 0.658641, -0.751445, 0.0123167, 0, 0, 0, 1),
            Qt.matrix4x4(0.851639, -0.0227428, -0.523635, 0.0110291, -0.523635, -0.0802699, -0.848153, 0.0106396, -0.0227428, 0.996514, -0.08027, 0.00134809, 0, 0, 0, 1),
            Qt.matrix4x4(0.864335, -0.0219965, -0.502436, 0.0109456, -0.502436, -0.0814638, -0.860768, 0.00344919, -0.0219965, 0.996434, -0.0814639, 0.00136401, 0, 0, 0, 1),
            Qt.matrix4x4(0.995541, -0.0390138, -0.0858824, 0.00254616, -0.0858824, -0.751445, -0.654182, 0.00557112, -0.0390138, 0.658641, -0.751445, 0.0123167, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: firefish_Root
        objectName: "Firefish_Root"
        source: "meshes/firefish_Root_mesh.mesh"
        skin: skin
        materials: [
            firefish_fin_low_material,
            firefish_body_low_material,
            firefish_fin_low_material,
            firefish_fin_low_material,
            firefish_fin_low_material,
            firefish_eye_low_material,
            firefish_eye_low_material,
            firefish_body_low_material,
            mouth_interior_material,
            firefish_fin_low_material,
            firefish_fin_low_material,
            firefish_fin_low_material,
            firefish_fin_low_material
        ]
        Node {
            id: collision_Body_Ellipsoid
            objectName: "COLLISION_Body_Ellipsoid"
        }
        Node {
            id: firefish_Rig
            objectName: "Firefish_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0226593)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.0235538, 0)
                        rotation: Qt.quaternion(1, 3.55271e-15, 0, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.00924261, 0)
                            rotation: Qt.quaternion(1, 3.55271e-15, 0, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.0134167, 0)
                                rotation: Qt.quaternion(1, 3.55271e-15, 0, 0)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.0113297, 0)
                                    rotation: Qt.quaternion(1, 3.55271e-15, 0, 0)
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.00626114, -0.00268334)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalSecondRear
                                objectName: "DorsalSecondRear"
                                position: Qt.vector3d(0, 0.0149074, 0.00143111)
                                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                        Node {
                            id: dorsalSecondFront
                            objectName: "DorsalSecondFront"
                            position: Qt.vector3d(0, 0.00566483, 0.00583433)
                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                        Node {
                            id: analFin
                            objectName: "AnalFin"
                            position: Qt.vector3d(0, 0.0163982, -0.00631666)
                            rotation: Qt.quaternion(0.820648, -0.571434, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: dorsalFirst
                        objectName: "DorsalFirst"
                        position: Qt.vector3d(0, 0.0149074, 0.00816928)
                        rotation: Qt.quaternion(0.772393, 0.635145, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: dorsalFirstMid
                            objectName: "DorsalFirstMid"
                            position: Qt.vector3d(0, 0.0117295, 0)
                            rotation: Qt.quaternion(0.984021, -0.178053, 0, 0)
                            Node {
                                id: dorsalFirstTip
                                objectName: "DorsalFirstTip"
                                position: Qt.vector3d(0, 0.0102272, 4.72937e-10)
                                rotation: Qt.quaternion(0.993486, -0.113958, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.00379089, 0.00775187, -0.000238519)
                        rotation: Qt.quaternion(0.961289, -0.0417512, -3.10025e-08, -0.272361)
                        Node {
                            id: pectoralLTip
                            objectName: "PectoralLTip"
                            position: Qt.vector3d(2.61934e-10, 0.00746083, -8.73115e-11)
                            rotation: Qt.quaternion(0.999924, -0.000321909, -0.000627366, 0.0123447)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00157582, 0.00954076, -0.00382659)
                        rotation: Qt.quaternion(0.909445, -0.413134, 0, -0.0472169)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.00379089, 0.00775187, -0.000238519)
                        rotation: Qt.quaternion(0.961289, -0.0417512, 3.10025e-08, 0.272361)
                        Node {
                            id: pectoralRTip
                            objectName: "PectoralRTip"
                            position: Qt.vector3d(-2.61934e-10, 0.00746083, -8.73115e-11)
                            rotation: Qt.quaternion(0.999924, -0.000321909, 0.000627366, -0.0123447)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00157582, 0.00954076, -0.00382659)
                        rotation: Qt.quaternion(0.909445, -0.413134, 0, 0.0472169)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0226593, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.00619617, 0.0011926)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.00379089, 0.00775187, -0.000238519)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.00379089, 0.00775187, -0.000238519)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00157582, 0.00954076, -0.00382659)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00157582, 0.00954076, -0.00382659)
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0226593) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0, 0.0226593) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0235538, 0) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0235538, 0) }
        }
        KeyframeGroup {
            target: dorsalFirst
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0149074, 0.00816928) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0149074, 0.00816928) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00379089, 0.00775187, -0.000238519) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00379089, 0.00775187, -0.000238519) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00157582, 0.00954076, -0.00382659) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00157582, 0.00954076, -0.00382659) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00379089, 0.00775187, -0.000238519) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00379089, 0.00775187, -0.000238519) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00157582, 0.00954076, -0.00382659) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00157582, 0.00954076, -0.00382659) }
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
            target: dorsalFirst
            property: "rotation"
            keyframeSource: "animations/dorsalFirst_rotation_0.qad"
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
            target: pectoralL
            property: "rotation"
            keyframeSource: "animations/pectoralL_rotation_0.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0226593) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0, 0.0226593) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0235538, 0) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0235538, 0) }
        }
        KeyframeGroup {
            target: dorsalFirst
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0149074, 0.00816928) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0149074, 0.00816928) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00379089, 0.00775187, -0.000238519) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00379089, 0.00775187, -0.000238519) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00157582, 0.00954076, -0.00382659) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00157582, 0.00954076, -0.00382659) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00379089, 0.00775187, -0.000238519) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00379089, 0.00775187, -0.000238519) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00157582, 0.00954076, -0.00382659) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00157582, 0.00954076, -0.00382659) }
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
            target: dorsalFirst
            property: "rotation"
            keyframeSource: "animations/dorsalFirst_rotation_1.qad"
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
            target: pectoralL
            property: "rotation"
            keyframeSource: "animations/pectoralL_rotation_1.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0226593) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0, 0.0226593) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0235538, 0) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0235538, 0) }
        }
        KeyframeGroup {
            target: dorsalFirst
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0149074, 0.00816928) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0149074, 0.00816928) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00379089, 0.00775187, -0.000238519) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00379089, 0.00775187, -0.000238519) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00157582, 0.00954076, -0.00382659) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00157582, 0.00954076, -0.00382659) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00379089, 0.00775187, -0.000238519) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00379089, 0.00775187, -0.000238519) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00157582, 0.00954076, -0.00382659) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00157582, 0.00954076, -0.00382659) }
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
            target: dorsalFirst
            property: "rotation"
            keyframeSource: "animations/dorsalFirst_rotation_2.qad"
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
            target: pectoralL
            property: "rotation"
            keyframeSource: "animations/pectoralL_rotation_2.qad"
        }
    }
}
