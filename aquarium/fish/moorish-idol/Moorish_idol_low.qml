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
        id: idol_eye_low_material
        objectName: "Idol_eye_low"
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
        id: idol_body_low_material
        objectName: "Idol_body_low"
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
        id: idol_fin_low_material
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
            dorsalRear,
            dorsalMid,
            analFin,
            dorsalFront,
            streamer1,
            streamer2,
            streamer3,
            streamer4,
            pectoralL,
            pectoralLTip,
            pelvicL,
            pectoralR,
            pectoralRTip,
            pelvicR
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0537236, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0092627, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0222305, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0463135, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0648389, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0308826, 0, 0, 1, 0.0518711, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0574287, 0, 0, 1, 0.0277881, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.840297, -0.542127, -0.0645672, 0, 0.542127, -0.840297, 0.00858686, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.069238, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.373607, -0.927587, -0.0691982, 0, 0.927587, 0.373607, -0.079576, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.226482, -0.974015, -0.0818555, 0, 0.974015, 0.226482, -0.0932768, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.0546766, -0.998504, -0.0981469, 0, 0.998504, 0.0546766, -0.111931, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.0689982, -0.997617, -0.12257, 0, 0.997617, -0.0689982, -0.12804, 0, 0, 0, 1),
            Qt.matrix4x4(0.861511, 0.0421513, 0.505986, -0.0224056, 0.505986, -0.154005, -0.848681, 0.0134505, 0.0421513, 0.987171, -0.154005, 0.0122505, 0, 0, 0, 1),
            Qt.matrix4x4(0.897249, 0.0374493, 0.439934, -0.0230915, 0.439934, -0.160341, -0.8836, -0.00949766, 0.0374493, 0.986351, -0.160341, 0.0123786, 0, 0, 0, 1),
            Qt.matrix4x4(0.997392, 0.0212725, 0.0689758, -0.00401636, 0.0689758, -0.562505, -0.823912, -0.00723431, 0.0212725, 0.82652, -0.562505, 0.0588457, 0, 0, 0, 1),
            Qt.matrix4x4(0.861511, -0.0421513, -0.505986, 0.0224056, -0.505986, -0.154005, -0.848681, 0.0134505, -0.0421513, 0.987171, -0.154005, 0.0122505, 0, 0, 0, 1),
            Qt.matrix4x4(0.897249, -0.0374493, -0.439934, 0.0230915, -0.439934, -0.160341, -0.8836, -0.00949766, -0.0374493, 0.986351, -0.160341, 0.0123786, 0, 0, 0, 1),
            Qt.matrix4x4(0.997392, -0.0212725, -0.0689758, 0.00401636, -0.0689758, -0.562505, -0.823912, -0.00723431, -0.0212725, 0.82652, -0.562505, 0.0588457, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: idol_Root
        objectName: "Idol_Root"
        source: "meshes/idol_Root_mesh.mesh"
        skin: skin
        materials: [
            idol_fin_low_material,
            idol_body_low_material,
            idol_body_low_material,
            idol_body_low_material,
            idol_fin_low_material,
            idol_fin_low_material,
            idol_fin_low_material,
            idol_eye_low_material,
            idol_eye_low_material,
            idol_body_low_material,
            mouth_interior_material,
            idol_fin_low_material,
            idol_fin_low_material,
            idol_fin_low_material,
            idol_fin_low_material
        ]
        Node {
            id: collision_Body_Ellipsoid
            objectName: "COLLISION_Body_Ellipsoid"
        }
        Node {
            id: idol_Rig
            objectName: "Idol_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0537236)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.0444609, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.0314932, 0)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.024083, 0)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.0185254, 0)
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.0400149, 0.0437199)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalRear
                                objectName: "DorsalRear"
                                position: Qt.vector3d(0, 0.0296406, 0.0308826)
                                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                        Node {
                            id: dorsalMid
                            objectName: "DorsalMid"
                            position: Qt.vector3d(0, 0.0370508, 0.0574287)
                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                        Node {
                            id: analFin
                            objectName: "AnalFin"
                            position: Qt.vector3d(0, 0.0370508, -0.0589107)
                            rotation: Qt.quaternion(0.878102, -0.478473, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: dorsalFront
                        objectName: "DorsalFront"
                        position: Qt.vector3d(0, 0.0537236, 0.069238)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: streamer1
                            objectName: "Streamer1"
                            position: Qt.vector3d(0, 0.0304286, -0.0344572)
                            rotation: Qt.quaternion(0.828736, -0.55964, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: streamer2
                                objectName: "Streamer2"
                                position: Qt.vector3d(0, 0.0260307, -3.72529e-09)
                                rotation: Qt.quaternion(0.99702, -0.0771384, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: streamer3
                                    objectName: "Streamer3"
                                    position: Qt.vector3d(0, 0.0341649, 1.86265e-09)
                                    rotation: Qt.quaternion(0.996228, -0.0867712, 0, 0)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: streamer4
                                        objectName: "Streamer4"
                                        position: Qt.vector3d(0, 0.0392906, 5.58794e-09)
                                        rotation: Qt.quaternion(0.998086, -0.061839, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                        }
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.0119805, 0.0290849, -0.00907744)
                        rotation: Qt.quaternion(0.961426, -0.0800918, -3.87475e-09, -0.263144)
                        Node {
                            id: pectoralLTip
                            objectName: "PectoralLTip"
                            position: Qt.vector3d(-1.22236e-09, 0.0246116, 3.49246e-10)
                            rotation: Qt.quaternion(0.999291, -0.00169779, -0.00358469, 0.0374527)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00325308, 0.0263061, -0.052621)
                        rotation: Qt.quaternion(0.954964, -0.294516, 0, -0.0361144)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.0119805, 0.0290849, -0.00907744)
                        rotation: Qt.quaternion(0.961426, -0.0800918, 3.87475e-09, 0.263144)
                        Node {
                            id: pectoralRTip
                            objectName: "PectoralRTip"
                            position: Qt.vector3d(1.22236e-09, 0.0246116, 3.49246e-10)
                            rotation: Qt.quaternion(0.999291, -0.00169779, 0.00358469, -0.0374527)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00325308, 0.0263061, -0.052621)
                        rotation: Qt.quaternion(0.954964, -0.294516, 0, 0.0361144)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0537236, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.0314227, -0.00870693)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.0119805, 0.0290849, -0.00907744)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.0119805, 0.0290849, -0.00907744)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00325308, 0.0263061, -0.052621)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00325308, 0.0263061, -0.052621)
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0537236) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0, 0.0537236) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0444609, 0) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0444609, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0537236, 0.069238) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0537236, 0.069238) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0119805, 0.0290849, -0.00907744) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.0119805, 0.0290849, -0.00907744) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00325308, 0.0263061, -0.052621) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00325308, 0.0263061, -0.052621) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0119805, 0.0290849, -0.00907744) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.0119805, 0.0290849, -0.00907744) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00325308, 0.0263061, -0.052621) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00325308, 0.0263061, -0.052621) }
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
            target: streamer4
            property: "position"
            keyframeSource: "animations/streamer4_position_0.qad"
        }
        KeyframeGroup {
            target: streamer4
            property: "rotation"
            keyframeSource: "animations/streamer4_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "animations/dorsalFront_rotation_0.qad"
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
            target: dorsalRear
            property: "position"
            keyframeSource: "animations/dorsalRear_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "animations/dorsalRear_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "animations/dorsalMid_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "animations/dorsalMid_rotation_0.qad"
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
            target: streamer1
            property: "position"
            keyframeSource: "animations/streamer1_position_0.qad"
        }
        KeyframeGroup {
            target: streamer1
            property: "rotation"
            keyframeSource: "animations/streamer1_rotation_0.qad"
        }
        KeyframeGroup {
            target: streamer2
            property: "position"
            keyframeSource: "animations/streamer2_position_0.qad"
        }
        KeyframeGroup {
            target: streamer2
            property: "rotation"
            keyframeSource: "animations/streamer2_rotation_0.qad"
        }
        KeyframeGroup {
            target: streamer3
            property: "position"
            keyframeSource: "animations/streamer3_position_0.qad"
        }
        KeyframeGroup {
            target: streamer3
            property: "rotation"
            keyframeSource: "animations/streamer3_rotation_0.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0537236) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0, 0.0537236) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0444609, 0) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0444609, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0537236, 0.069238) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0537236, 0.069238) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0119805, 0.0290849, -0.00907744) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.0119805, 0.0290849, -0.00907744) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00325308, 0.0263061, -0.052621) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00325308, 0.0263061, -0.052621) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0119805, 0.0290849, -0.00907744) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.0119805, 0.0290849, -0.00907744) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00325308, 0.0263061, -0.052621) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00325308, 0.0263061, -0.052621) }
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
            target: streamer4
            property: "position"
            keyframeSource: "animations/streamer4_position_1.qad"
        }
        KeyframeGroup {
            target: streamer4
            property: "rotation"
            keyframeSource: "animations/streamer4_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "animations/dorsalFront_rotation_1.qad"
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
            target: dorsalRear
            property: "position"
            keyframeSource: "animations/dorsalRear_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "animations/dorsalRear_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "animations/dorsalMid_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "animations/dorsalMid_rotation_1.qad"
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
            target: streamer1
            property: "position"
            keyframeSource: "animations/streamer1_position_1.qad"
        }
        KeyframeGroup {
            target: streamer1
            property: "rotation"
            keyframeSource: "animations/streamer1_rotation_1.qad"
        }
        KeyframeGroup {
            target: streamer2
            property: "position"
            keyframeSource: "animations/streamer2_position_1.qad"
        }
        KeyframeGroup {
            target: streamer2
            property: "rotation"
            keyframeSource: "animations/streamer2_rotation_1.qad"
        }
        KeyframeGroup {
            target: streamer3
            property: "position"
            keyframeSource: "animations/streamer3_position_1.qad"
        }
        KeyframeGroup {
            target: streamer3
            property: "rotation"
            keyframeSource: "animations/streamer3_rotation_1.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0537236) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0, 0.0537236) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0444609, 0) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0444609, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0537236, 0.069238) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0537236, 0.069238) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0119805, 0.0290849, -0.00907744) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.0119805, 0.0290849, -0.00907744) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00325308, 0.0263061, -0.052621) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00325308, 0.0263061, -0.052621) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0119805, 0.0290849, -0.00907744) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.0119805, 0.0290849, -0.00907744) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00325308, 0.0263061, -0.052621) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00325308, 0.0263061, -0.052621) }
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
            target: streamer4
            property: "position"
            keyframeSource: "animations/streamer4_position_2.qad"
        }
        KeyframeGroup {
            target: streamer4
            property: "rotation"
            keyframeSource: "animations/streamer4_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "animations/dorsalFront_rotation_2.qad"
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
            target: dorsalRear
            property: "position"
            keyframeSource: "animations/dorsalRear_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "animations/dorsalRear_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "animations/dorsalMid_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "animations/dorsalMid_rotation_2.qad"
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
            target: streamer1
            property: "position"
            keyframeSource: "animations/streamer1_position_2.qad"
        }
        KeyframeGroup {
            target: streamer1
            property: "rotation"
            keyframeSource: "animations/streamer1_rotation_2.qad"
        }
        KeyframeGroup {
            target: streamer2
            property: "position"
            keyframeSource: "animations/streamer2_position_2.qad"
        }
        KeyframeGroup {
            target: streamer2
            property: "rotation"
            keyframeSource: "animations/streamer2_rotation_2.qad"
        }
        KeyframeGroup {
            target: streamer3
            property: "position"
            keyframeSource: "animations/streamer3_position_2.qad"
        }
        KeyframeGroup {
            target: streamer3
            property: "rotation"
            keyframeSource: "animations/streamer3_rotation_2.qad"
        }
    }
}
