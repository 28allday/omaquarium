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
    property url textureData: "../../fish/lyretail-anthias-orange/maps/textureData.png"
    property url textureData4: "../../fish/lyretail-anthias-orange/maps/textureData4.png"
    property url textureData6: "../../fish/lyretail-anthias-orange/maps/textureData6.png"
    property url textureData20: "../../fish/lyretail-anthias-orange/maps/textureData20.png"
    property url textureData8: "../../fish/lyretail-anthias-orange/maps/textureData8.png"
    property url textureData18: "../../fish/lyretail-anthias-orange/maps/textureData18.png"
    property url textureData11: "../../fish/lyretail-anthias-orange/maps/textureData11.png"
    property url textureData13: "../../fish/lyretail-anthias-orange/maps/textureData13.png"
    property url textureData15: "../../fish/lyretail-anthias-orange/maps/textureData15.png"
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
        id: anthiasOrange_eye_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: anthiasOrange_body_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: anthiasOrange_fin_low_material
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
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0211485, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.00302122, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.00725093, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0169188, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0259825, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.414671, -0.909972, -0.04017, 0, 0.909972, 0.414671, 0.0116651, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.44971, -0.893174, -0.0437531, 0, 0.893174, -0.44971, -0.00849927, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.901716, -0.43233, -0.0123832, 0, 0.432329, 0.901716, 0.00947528, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, -0.679023, -0.734117, -0.014272, 0, 0.734117, -0.679023, -0.00147762, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.925664, -0.378346, -0.0114651, 0, 0.378346, 0.925664, -0.000116742, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.843227, -0.537558, -0.00764135, 0, 0.537558, 0.843227, -0.0127538, 0, 0, 0, 1),
            Qt.matrix4x4(0.853486, -0.0194514, 0.520752, -0.0119027, 0.520752, 0.069136, -0.850904, 0.00848816, -0.0194514, 0.997418, 0.069136, 0.00184508, 0, 0, 0, 1),
            Qt.matrix4x4(0.862258, -0.0190089, 0.506113, -0.0119029, 0.506113, 0.0698453, -0.859634, 0.000170427, -0.0190089, 0.997377, 0.0698453, 0.00183619, 0, 0, 0, 1),
            Qt.matrix4x4(0.994752, 0.0311932, 0.0974485, -0.00271187, 0.0974485, -0.579174, -0.809359, 0.00311538, 0.0311932, 0.814607, -0.579174, 0.012926, 0, 0, 0, 1),
            Qt.matrix4x4(0.853486, 0.0194514, -0.520752, 0.0119027, -0.520752, 0.069136, -0.850904, 0.00848816, 0.0194514, 0.997418, 0.069136, 0.00184508, 0, 0, 0, 1),
            Qt.matrix4x4(0.862258, 0.0190089, -0.506113, 0.0119029, -0.506113, 0.0698453, -0.859634, 0.000170427, 0.0190089, 0.997377, 0.0698453, 0.00183619, 0, 0, 0, 1),
            Qt.matrix4x4(0.994752, -0.0311932, -0.0974485, 0.00271187, -0.0974485, -0.579174, -0.809359, 0.00311538, -0.0311932, 0.814607, -0.579174, 0.012926, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: anthiasOrange_Root
        objectName: "AnthiasOrange_Root"
        source: "../../fish/lyretail-anthias-orange/meshes/anthiasOrange_Root_mesh.mesh"
        skin: skin
        materials: [
            anthiasOrange_fin_low_material,
            anthiasOrange_body_low_material,
            anthiasOrange_fin_low_material,
            anthiasOrange_fin_low_material,
            anthiasOrange_eye_low_material,
            anthiasOrange_eye_low_material,
            anthiasOrange_body_low_material,
            anthiasOrange_body_low_material,
            anthiasOrange_body_low_material,
            anthiasOrange_body_low_material,
            anthiasOrange_body_low_material,
            anthiasOrange_body_low_material,
            anthiasOrange_body_low_material,
            mouth_interior_material,
            anthiasOrange_fin_low_material,
            anthiasOrange_fin_low_material,
            anthiasOrange_fin_low_material,
            anthiasOrange_fin_low_material
        ]
        Node {
            id: anthiasOrange_Rig
            objectName: "AnthiasOrange_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0211485)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.0181273, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.0102722, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.00966791, 0)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.00906366, 0)
                                    Node {
                                        id: caudalUpperTip
                                        objectName: "CaudalUpperTip"
                                        position: Qt.vector3d(0, 0.0154082, 0.00604244)
                                        rotation: Qt.quaternion(0.977234, 0.212166, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                    Node {
                                        id: caudalLowerTip
                                        objectName: "CaudalLowerTip"
                                        position: Qt.vector3d(0, 0.0169188, -0.0120849)
                                        rotation: Qt.quaternion(0.972927, -0.231112, 0, 0)
                                    }
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.0255595, -0.0164354)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalRear
                                objectName: "DorsalRear"
                                position: Qt.vector3d(0, 0.00664669, 0.00706966)
                                rotation: Qt.quaternion(0.846265, 0.532762, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: analFin
                                objectName: "AnalFin"
                                position: Qt.vector3d(0, 0.00422971, -0.00860624)
                                rotation: Qt.quaternion(0.93116, -0.364611, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                        Node {
                            id: dorsalMid
                            objectName: "DorsalMid"
                            position: Qt.vector3d(0, 0.00725093, 0.010657)
                            rotation: Qt.quaternion(0.830165, 0.557518, 0, 0)
                        }
                    }
                    Node {
                        id: dorsalFront
                        objectName: "DorsalFront"
                        position: Qt.vector3d(0, 0.0145019, 0.0132993)
                        rotation: Qt.quaternion(0.8768, 0.480854, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralL
                        objectName: "PectoralL"
                        position: Qt.vector3d(0.00577441, 0.00785518, -0.00265867)
                        rotation: Qt.quaternion(0.962004, 0.0359333, 0, -0.27066)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralLTip
                            objectName: "PectoralLTip"
                            position: Qt.vector3d(6.18456e-10, 0.00852144, -4.36557e-11)
                            rotation: Qt.quaternion(0.999964, 0.000191152, 0.000372305, 0.00852756)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.00199085, 0.0108764, -0.00864069)
                        rotation: Qt.quaternion(0.951146, -0.304461, -1.95832e-09, -0.0512269)
                    }
                    Node {
                        id: pectoralR
                        objectName: "PectoralR"
                        position: Qt.vector3d(-0.00577441, 0.00785518, -0.00265867)
                        rotation: Qt.quaternion(0.962004, 0.0359333, 0, 0.27066)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralRTip
                            objectName: "PectoralRTip"
                            position: Qt.vector3d(-6.18456e-10, 0.00852144, -4.36557e-11)
                            rotation: Qt.quaternion(0.999964, 0.000191152, -0.000372305, -0.00852756)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.00199085, 0.0108764, -0.00864069)
                        rotation: Qt.quaternion(0.951146, -0.304461, 1.95832e-09, 0.0512269)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0211485, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.00730941, 0.00102722)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_L_Attachment
                        objectName: "Pectoral_L_Attachment"
                        position: Qt.vector3d(0.00577441, 0.00785518, -0.00265867)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoral_R_Attachment
                        objectName: "Pectoral_R_Attachment"
                        position: Qt.vector3d(-0.00577441, 0.00785518, -0.00265867)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_L_Attachment
                        objectName: "Pelvic_L_Attachment"
                        position: Qt.vector3d(0.00199085, 0.0108764, -0.00864069)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvic_R_Attachment
                        objectName: "Pelvic_R_Attachment"
                        position: Qt.vector3d(-0.00199085, 0.0108764, -0.00864069)
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0211485) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0, 0.0211485) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0181273, 0) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0181273, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0145019, 0.0132993) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0.0145019, 0.0132993) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00577441, 0.00785518, -0.00265867) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00577441, 0.00785518, -0.00265867) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00199085, 0.0108764, -0.00864069) }
            Keyframe { frame: 4000; value: Qt.vector3d(0.00199085, 0.0108764, -0.00864069) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00577441, 0.00785518, -0.00265867) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00577441, 0.00785518, -0.00265867) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00199085, 0.0108764, -0.00864069) }
            Keyframe { frame: 4000; value: Qt.vector3d(-0.00199085, 0.0108764, -0.00864069) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pelvicR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralRTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralRTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pelvicL_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralLTip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralLTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalFront_rotation_0.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/midBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/rearBody_position_0.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/rearBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/peduncle_position_0.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/peduncle_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalFin_position_0.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalUpperTip_position_0.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalUpperTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalLowerTip_position_0.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalLowerTip_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalRear_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalRear_rotation_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/analFin_position_0.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/analFin_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalMid_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalMid_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralL_rotation_0.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0211485) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0, 0.0211485) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0181273, 0) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0181273, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0145019, 0.0132993) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0.0145019, 0.0132993) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00577441, 0.00785518, -0.00265867) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00577441, 0.00785518, -0.00265867) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00199085, 0.0108764, -0.00864069) }
            Keyframe { frame: 2000; value: Qt.vector3d(0.00199085, 0.0108764, -0.00864069) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00577441, 0.00785518, -0.00265867) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00577441, 0.00785518, -0.00265867) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00199085, 0.0108764, -0.00864069) }
            Keyframe { frame: 2000; value: Qt.vector3d(-0.00199085, 0.0108764, -0.00864069) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pelvicR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralRTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralRTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pelvicL_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralLTip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralLTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalFront_rotation_1.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/midBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/rearBody_position_1.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/rearBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/peduncle_position_1.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/peduncle_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalFin_position_1.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalUpperTip_position_1.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalUpperTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalLowerTip_position_1.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalLowerTip_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalRear_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalRear_rotation_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/analFin_position_1.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/analFin_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalMid_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalMid_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralL_rotation_1.qad"
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0211485) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0, 0.0211485) }
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
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0181273, 0) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0181273, 0) }
        }
        KeyframeGroup {
            target: dorsalFront
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0145019, 0.0132993) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0.0145019, 0.0132993) }
        }
        KeyframeGroup {
            target: pectoralL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00577441, 0.00785518, -0.00265867) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00577441, 0.00785518, -0.00265867) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.00199085, 0.0108764, -0.00864069) }
            Keyframe { frame: 1000; value: Qt.vector3d(0.00199085, 0.0108764, -0.00864069) }
        }
        KeyframeGroup {
            target: pectoralR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00577441, 0.00785518, -0.00265867) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00577441, 0.00785518, -0.00265867) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.00199085, 0.0108764, -0.00864069) }
            Keyframe { frame: 1000; value: Qt.vector3d(-0.00199085, 0.0108764, -0.00864069) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pelvicR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralRTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralRTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralRTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pelvicL_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralLTip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralLTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralLTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalFront
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalFront_rotation_2.qad"
        }
        KeyframeGroup {
            target: midBody
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/midBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/rearBody_position_2.qad"
        }
        KeyframeGroup {
            target: rearBody
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/rearBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/peduncle_position_2.qad"
        }
        KeyframeGroup {
            target: peduncle
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/peduncle_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalFin_position_2.qad"
        }
        KeyframeGroup {
            target: caudalFin
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalUpperTip_position_2.qad"
        }
        KeyframeGroup {
            target: caudalUpperTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalUpperTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalLowerTip_position_2.qad"
        }
        KeyframeGroup {
            target: caudalLowerTip
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/caudalLowerTip_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalRear_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalRear
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalRear_rotation_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/analFin_position_2.qad"
        }
        KeyframeGroup {
            target: analFin
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/analFin_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "position"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalMid_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalMid
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/dorsalMid_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL
            property: "rotation"
            keyframeSource: "../../fish/lyretail-anthias-orange/animations/pectoralL_rotation_2.qad"
        }
    }
}
