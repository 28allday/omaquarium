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
        id: anthiasPurple_eye_low_material
        objectName: "AnthiasPurple_eye_low"
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
        id: anthiasPurple_body_low_material
        objectName: "AnthiasPurple_body_low"
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
        id: anthiasPurple_fin_low_material
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
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0264357, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.00377653, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.00906367, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0211486, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0324781, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.414671, -0.909972, -0.0502125, 0, 0.909972, 0.414671, 0.0145813, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.44971, -0.893175, -0.0546914, 0, 0.893175, -0.44971, -0.0106241, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.901716, -0.43233, -0.015479, 0, 0.432329, 0.901716, 0.0118441, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.679023, -0.734118, -0.01784, 0, 0.734117, -0.679023, -0.00184703, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.925664, -0.378346, -0.0143314, 0, 0.378346, 0.925664, -0.000145925, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.843227, -0.537558, -0.00955169, 0, 0.537558, 0.843227, -0.0159423, 0, 0, 0, 1),
            Qt.matrix4x4(0.853486, -0.0194514, 0.520752, -0.0148783, 0.520752, 0.069136, -0.850904, 0.0106102, -0.0194514, 0.997418, 0.069136, 0.00230635, 0, 0, 0, 1),
            Qt.matrix4x4(0.862258, -0.0190089, 0.506113, -0.0148786, 0.506113, 0.0698453, -0.859634, 0.000213032, -0.0190089, 0.997377, 0.0698453, 0.00229524, 0, 0, 0, 1),
            Qt.matrix4x4(0.994752, 0.0311932, 0.0974485, -0.00338984, 0.0974485, -0.579174, -0.809359, 0.00389423, 0.0311932, 0.814607, -0.579174, 0.0161575, 0, 0, 0, 1),
            Qt.matrix4x4(0.853486, 0.0194514, -0.520752, 0.0148783, -0.520752, 0.069136, -0.850904, 0.0106102, 0.0194514, 0.997418, 0.069136, 0.00230635, 0, 0, 0, 1),
            Qt.matrix4x4(0.862258, 0.0190089, -0.506113, 0.0148786, -0.506113, 0.0698453, -0.859634, 0.000213032, 0.0190089, 0.997377, 0.0698453, 0.00229524, 0, 0, 0, 1),
            Qt.matrix4x4(0.994752, -0.0311932, -0.0974485, 0.00338984, -0.0974485, -0.579174, -0.809359, 0.00389423, -0.0311932, 0.814607, -0.579174, 0.0161575, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: anthiasPurple_Root
        objectName: "AnthiasPurple_Root"
        source: "meshes/anthiasPurple_Root_mesh.mesh"
        skin: skin
        materials: [
            anthiasPurple_fin_low_material,
            anthiasPurple_body_low_material,
            anthiasPurple_fin_low_material,
            anthiasPurple_fin_low_material,
            anthiasPurple_eye_low_material,
            anthiasPurple_eye_low_material,
            anthiasPurple_body_low_material,
            anthiasPurple_body_low_material,
            anthiasPurple_body_low_material,
            anthiasPurple_body_low_material,
            anthiasPurple_body_low_material,
            anthiasPurple_body_low_material,
            anthiasPurple_body_low_material,
            mouth_interior_material,
            anthiasPurple_fin_low_material,
            anthiasPurple_fin_low_material,
            anthiasPurple_fin_low_material,
            anthiasPurple_fin_low_material
        ]
        Node {
            id: anthiasPurple_Rig
            objectName: "AnthiasPurple_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0264357)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.0226592, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.0128402, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.0120849, 0)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.0113296, 0)
                                    Node {
                                        id: caudalUpperTip
                                        objectName: "CaudalUpperTip"
                                        position: Qt.vector3d(0, 0.0192603, 0.00755305)
                                        rotation: Qt.quaternion(0.977234, 0.212166, 0, 0)
                                    }
                                    Node {
                                        id: caudalLowerTip
                                        objectName: "CaudalLowerTip"
                                        position: Qt.vector3d(0, 0.0211485, -0.0151061)
                                        rotation: Qt.quaternion(0.972927, -0.231112, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.0319494, -0.0205443)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalRear
                                objectName: "DorsalRear"
                                position: Qt.vector3d(0, 0.00830836, 0.00883707)
                                rotation: Qt.quaternion(0.846265, 0.532762, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: analFin
                                objectName: "AnalFin"
                                position: Qt.vector3d(0, 0.00528714, -0.0107578)
                                rotation: Qt.quaternion(0.93116, -0.364611, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                        Node {
                            id: dorsalMid
                            objectName: "DorsalMid"
                            position: Qt.vector3d(0, 0.00906366, 0.0133212)
                            rotation: Qt.quaternion(0.830165, 0.557519, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: dorsalFront
                        objectName: "DorsalFront"
                        position: Qt.vector3d(0, 0.0181273, 0.0166241)
                        rotation: Qt.quaternion(0.8768, 0.480854, 0, 0)
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.00721802, 0.00981897, -0.00332334)
                        rotation: Qt.quaternion(0.962004, 0.0359333, -9.68107e-10, -0.27066)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralLTip
                            objectName: "PectoralLTip"
                            position: Qt.vector3d(8.36735e-10, 0.0106518, -4.36557e-10)
                            rotation: Qt.quaternion(0.999964, 0.000191153, 0.000372307, 0.00852756)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00248856, 0.0135955, -0.0108009)
                        rotation: Qt.quaternion(0.951146, -0.304461, -9.79158e-10, -0.0512269)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.00721802, 0.00981897, -0.00332334)
                        rotation: Qt.quaternion(0.962004, 0.0359333, 9.68107e-10, 0.27066)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralRTip
                            objectName: "PectoralRTip"
                            position: Qt.vector3d(-8.36735e-10, 0.0106518, -4.36557e-10)
                            rotation: Qt.quaternion(0.999964, 0.000191153, -0.000372307, -0.00852756)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00248856, 0.0135955, -0.0108009)
                        rotation: Qt.quaternion(0.951146, -0.304461, 9.79158e-10, 0.0512269)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0264357, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.00913677, 0.00128402)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.00721802, 0.00981897, -0.00332334)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.00721802, 0.00981897, -0.00332334)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00248856, 0.0135955, -0.0108009)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00248856, 0.0135955, -0.0108009)
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0264357) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0, 0.0264357) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0226592, 0) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0226592, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0181273, 0.0166241) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0181273, 0.0166241) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00721802, 0.00981897, -0.00332334) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00721802, 0.00981897, -0.00332334) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00248856, 0.0135955, -0.0108009) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00248856, 0.0135955, -0.0108009) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00721802, 0.00981897, -0.00332334) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00721802, 0.00981897, -0.00332334) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00248856, 0.0135955, -0.0108009) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00248856, 0.0135955, -0.0108009) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0264357) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0, 0.0264357) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0226592, 0) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0226592, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0181273, 0.0166241) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0181273, 0.0166241) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00721802, 0.00981897, -0.00332334) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00721802, 0.00981897, -0.00332334) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00248856, 0.0135955, -0.0108009) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00248856, 0.0135955, -0.0108009) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00721802, 0.00981897, -0.00332334) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00721802, 0.00981897, -0.00332334) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00248856, 0.0135955, -0.0108009) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00248856, 0.0135955, -0.0108009) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0264357) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0, 0.0264357) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0226592, 0) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0226592, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0181273, 0.0166241) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0181273, 0.0166241) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00721802, 0.00981897, -0.00332334) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00721802, 0.00981897, -0.00332334) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00248856, 0.0135955, -0.0108009) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00248856, 0.0135955, -0.0108009) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00721802, 0.00981897, -0.00332334) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00721802, 0.00981897, -0.00332334) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00248856, 0.0135955, -0.0108009) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00248856, 0.0135955, -0.0108009) }
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
            target: pectoralL
            property: "rotation"
            keyframeSource: "animations/pectoralL_rotation_2.qad"
        }
    }
}
