import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node
    property bool animate: true
    property real poseTimeMs: 0

    // Resources
    property url textureData: "maps/textureData.png"
    property url textureData7: "maps/textureData7.png"
    property url textureData9: "maps/textureData9.png"
    Texture {
        id: _0_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData
    }
    Texture {
        id: _1_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData7
    }
    Texture {
        id: _2_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData9
    }
    CustomMaterial {
        id: gracilaria_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        fragmentShader: "../../leaf.frag"
        vertexShader: "../../leaf.vert"
        property TextureInput leafMap: TextureInput { texture: _0_texture }
        property TextureInput leafSurface: TextureInput { texture: _1_texture }
        property TextureInput leafNormal: TextureInput { texture: _2_texture }
        property real pigmentLow: 0.055
        property real pigmentHigh: 0.29
        property real leafHeight: 0.1533
        property vector3d shadePigment: Qt.vector3d(0.017,0.1,0.009)
        property vector3d litPigment: Qt.vector3d(0.19,0.58,0.028)
    }
    Skin {
        id: skin
        joints: [
            root,
            gracilaria_Frond0_0,
            gracilaria_Frond0_1,
            gracilaria_Frond0_2,
            gracilaria_Frond1_0,
            gracilaria_Frond1_1,
            gracilaria_Frond1_2,
            gracilaria_Frond2_0,
            gracilaria_Frond2_1,
            gracilaria_Frond2_2,
            gracilaria_Frond3_0,
            gracilaria_Frond3_1,
            gracilaria_Frond3_2,
            gracilaria_Frond4_0,
            gracilaria_Frond4_1,
            gracilaria_Frond4_2,
            gracilaria_Frond5_0,
            gracilaria_Frond5_1,
            gracilaria_Frond5_2,
            gracilaria_Frond6_0,
            gracilaria_Frond6_1,
            gracilaria_Frond6_2
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.924277, -0.264554, 0.275178, -0.0108268, 0.275178, 0.961393, 0, -0.00426353, -0.264554, 0.075723, 0.961393, 0.00309893, 0, 0, 0, 1),
            Qt.matrix4x4(0.924277, -0.264554, 0.275178, -0.0108268, 0.275178, 0.961393, -7.45058e-09, -0.0466603, -0.264555, 0.0757231, 0.961393, 0.00309893, 0, 0, 0, 1),
            Qt.matrix4x4(0.924277, -0.264555, 0.275178, -0.0108268, 0.275178, 0.961393, -7.45058e-09, -0.0890571, -0.264555, 0.0757231, 0.961393, 0.00309893, 0, 0, 0, 1),
            Qt.matrix4x4(0.957811, 0.185289, -0.219693, 0.00679678, -0.219693, 0.964878, -0.144033, -0.00388106, 0.185289, 0.186222, 0.964878, 0.00797636, 0, 0, 0, 1),
            Qt.matrix4x4(0.957811, 0.185289, -0.219693, 0.00679679, -0.219693, 0.964878, -0.144033, -0.0430039, 0.185289, 0.186222, 0.964878, 0.00797636, 0, 0, 0, 1),
            Qt.matrix4x4(0.957811, 0.185289, -0.219693, 0.00679679, -0.219693, 0.964878, -0.144033, -0.0821268, 0.185289, 0.186222, 0.964878, 0.00797636, 0, 0, 0, 1),
            Qt.matrix4x4(0.999463, -0.025114, 0.0210452, -0.00121009, 0.0210452, 0.984315, 0.175159, -0.00275108, -0.025114, -0.174622, 0.984315, -0.00960671, 0, 0, 0, 1),
            Qt.matrix4x4(0.999463, -0.025114, 0.0210452, -0.00121009, 0.0210452, 0.984315, 0.175159, -0.0501527, -0.025114, -0.174622, 0.984315, -0.00960672, 0, 0, 0, 1),
            Qt.matrix4x4(0.999463, -0.025114, 0.0210452, -0.00121009, 0.0210452, 0.984315, 0.175159, -0.0975544, -0.025114, -0.174622, 0.984315, -0.00960671, 0, 0, 0, 1),
            Qt.matrix4x4(0.967577, -0.159673, 0.195702, -0.00538181, 0.195702, 0.96377, -0.181241, -0.00383316, -0.159673, 0.213664, 0.96377, 0.00858805, 0, 0, 0, 1),
            Qt.matrix4x4(0.967577, -0.159673, 0.195702, -0.00538182, 0.195702, 0.96377, -0.181241, -0.0402414, -0.159673, 0.213664, 0.96377, 0.00858805, 0, 0, 0, 1),
            Qt.matrix4x4(0.967577, -0.159673, 0.195702, -0.00538182, 0.195702, 0.96377, -0.181241, -0.0766497, -0.159673, 0.213664, 0.96377, 0.00858805, 0, 0, 0, 1),
            Qt.matrix4x4(0.920539, 0.275437, -0.277023, 0.0110815, -0.277023, 0.960254, 0.0342154, -0.00429422, 0.275437, 0.0452453, 0.960254, 0.00157552, 0, 0, 0, 1),
            Qt.matrix4x4(0.920539, 0.275437, -0.277023, 0.0110815, -0.277023, 0.960254, 0.0342154, -0.0457928, 0.275437, 0.0452453, 0.960254, 0.00157552, 0, 0, 0, 1),
            Qt.matrix4x4(0.920539, 0.275437, -0.277023, 0.0110815, -0.277023, 0.960254, 0.0342154, -0.0872913, 0.275437, 0.0452453, 0.960254, 0.00157552, 0, 0, 0, 1),
            Qt.matrix4x4(0.956248, -0.21411, 0.199364, -0.0105163, 0.199364, 0.975639, 0.0915515, -0.0034831, -0.21411, -0.0477998, 0.975639, -0.00306711, 0, 0, 0, 1),
            Qt.matrix4x4(0.956248, -0.21411, 0.199364, -0.0105163, 0.199364, 0.975639, 0.0915514, -0.0527073, -0.21411, -0.0477998, 0.975639, -0.00306711, 0, 0, 0, 1),
            Qt.matrix4x4(0.956249, -0.21411, 0.199364, -0.0105163, 0.199364, 0.975639, 0.0915514, -0.101931, -0.21411, -0.0477998, 0.97564, -0.00306711, 0, 0, 0, 1),
            Qt.matrix4x4(0.996742, 0.051966, -0.0616758, 0.0023898, -0.0616758, 0.9839, -0.16774, -0.00279428, 0.051966, 0.170998, 0.9839, 0.00950368, 0, 0, 0, 1),
            Qt.matrix4x4(0.996742, 0.051966, -0.0616758, 0.0023898, -0.0616758, 0.9839, -0.16774, -0.0508448, 0.051966, 0.170998, 0.9839, 0.00950368, 0, 0, 0, 1),
            Qt.matrix4x4(0.996742, 0.051966, -0.0616758, 0.0023898, -0.0616758, 0.9839, -0.16774, -0.0988953, 0.051966, 0.170998, 0.9839, 0.00950368, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: foliage_Root
        objectName: "Foliage_Root"
        source: "meshes/foliage_SkinnedSurface_mesh.mesh"
        skin: skin
        materials: [
            gracilaria_low_material
        ]
        Node {
            id: foliageRig
            objectName: "FoliageRig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: gracilaria_Frond0_0
                    objectName: "gracilaria_Frond0_0"
                    position: Qt.vector3d(0.012, 0.001, 0)
                    rotation: Qt.quaternion(0.980697, -0.0193034, -0.137589, -0.137589)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: gracilaria_Frond0_1
                        objectName: "gracilaria_Frond0_1"
                        position: Qt.vector3d(-8.44399e-10, 0.0423968, -1.61976e-10)
                        rotation: Qt.quaternion(1, -4.47248e-09, -1.58325e-08, 2.13868e-10)
                        Node {
                            id: gracilaria_Frond0_2
                            objectName: "gracilaria_Frond0_2"
                            position: Qt.vector3d(-2.74331e-09, 0.0423968, -5.58598e-11)
                            rotation: Qt.quaternion(1, -9.58066e-09, -1.21072e-08, -2.28083e-08)
                        }
                    }
                }
                Node {
                    id: gracilaria_Frond1_0
                    objectName: "gracilaria_Frond1_0"
                    position: Qt.vector3d(-0.00884061, 0.001, -0.006762)
                    rotation: Qt.quaternion(0.985846, -0.0837493, 0.102699, 0.102699)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: gracilaria_Frond1_1
                        objectName: "gracilaria_Frond1_1"
                        position: Qt.vector3d(-6.98492e-10, 0.0391229, 0)
                        rotation: Qt.quaternion(1, -1.86265e-09, -1.95578e-08, -1.67638e-08)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: gracilaria_Frond1_2
                            objectName: "gracilaria_Frond1_2"
                            position: Qt.vector3d(-4.65661e-10, 0.0391229, 9.31323e-10)
                            rotation: Qt.quaternion(1, 1.21072e-08, 2.70084e-08, 6.51926e-09)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: gracilaria_Frond2_0
                    objectName: "gracilaria_Frond2_0"
                    position: Qt.vector3d(0.00102608, 0.001, 0.00996338)
                    rotation: Qt.quaternion(0.996004, 0.087796, -0.0115861, -0.0115861)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: gracilaria_Frond2_1
                        objectName: "gracilaria_Frond2_1"
                        position: Qt.vector3d(-1.45519e-10, 0.0474016, -1.69166e-09)
                        rotation: Qt.quaternion(1, -3.72238e-08, 3.49246e-09, 7.79983e-09)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: gracilaria_Frond2_2
                            objectName: "gracilaria_Frond2_2"
                            position: Qt.vector3d(-1.74623e-10, 0.0474016, -3.16504e-09)
                            rotation: Qt.quaternion(1, -1.45524e-11, 4.65661e-10, -3.49246e-10)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: gracilaria_Frond3_0
                    objectName: "gracilaria_Frond3_0"
                    position: Qt.vector3d(0.00732875, 0.001, -0.00791839)
                    rotation: Qt.quaternion(0.986803, -0.100047, -0.0900319, -0.090032)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: gracilaria_Frond3_1
                        objectName: "gracilaria_Frond3_1"
                        position: Qt.vector3d(0, 0.0364082, -4.65661e-10)
                        rotation: Qt.quaternion(1, 5.58794e-09, -2.42144e-08, 1.49012e-08)
                        Node {
                            id: gracilaria_Frond3_2
                            objectName: "gracilaria_Frond3_2"
                            position: Qt.vector3d(0, 0.0364083, -1.39698e-09)
                            rotation: Qt.quaternion(1, 2.65427e-08, 2.04891e-08, 4.65661e-09)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: gracilaria_Frond4_0
                    objectName: "gracilaria_Frond4_0"
                    position: Qt.vector3d(-0.0118245, 0.001, 0.00170387)
                    rotation: Qt.quaternion(0.979929, -0.00281397, 0.140944, 0.140944)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: gracilaria_Frond4_1
                        objectName: "gracilaria_Frond4_1"
                        position: Qt.vector3d(1.74623e-10, 0.0414986, -1.16415e-10)
                        rotation: Qt.quaternion(1, 1.86265e-09, 1.53668e-08, -1.55997e-08)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: gracilaria_Frond4_2
                            objectName: "gracilaria_Frond4_2"
                            position: Qt.vector3d(-1.04774e-09, 0.0414986, 2.32831e-10)
                            rotation: Qt.quaternion(1, 3.72529e-09, -3.14321e-08, -1.49012e-08)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: gracilaria_Frond5_0
                    objectName: "gracilaria_Frond5_0"
                    position: Qt.vector3d(0.0100939, 0.001, 0.00540785)
                    rotation: Qt.quaternion(0.988373, 0.0352476, -0.104584, -0.104584)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: gracilaria_Frond5_1
                        objectName: "gracilaria_Frond5_1"
                        position: Qt.vector3d(0, 0.0492242, -2.32831e-10)
                        rotation: Qt.quaternion(1, -5.58794e-09, 3.07336e-08, 7.45058e-09)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: gracilaria_Frond5_2
                            objectName: "gracilaria_Frond5_2"
                            position: Qt.vector3d(9.31323e-10, 0.0492242, -6.98492e-10)
                            rotation: Qt.quaternion(1, -2.79397e-09, 2.32831e-08, 1.49012e-08)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: gracilaria_Frond6_0
                    objectName: "gracilaria_Frond6_0"
                    position: Qt.vector3d(-0.00304823, 0.001, -0.00967199)
                    rotation: Qt.quaternion(0.995558, -0.0850622, 0.0285372, 0.0285372)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: gracilaria_Frond6_1
                        objectName: "gracilaria_Frond6_1"
                        position: Qt.vector3d(0, 0.0480505, -1.5425e-09)
                        rotation: Qt.quaternion(1, 3.7835e-09, -6.51926e-09, -4.42378e-09)
                        Node {
                            id: gracilaria_Frond6_2
                            objectName: "gracilaria_Frond6_2"
                            position: Qt.vector3d(-3.49246e-10, 0.0480505, -9.60426e-10)
                            rotation: Qt.quaternion(1, -4.092e-08, 5.82077e-09, 5.58794e-09)
                        }
                    }
                }
            }
        }
        Node {
            id: gracilaria_Attachment0
            objectName: "gracilaria_Attachment0"
            position: Qt.vector3d(0.012, 0.001, 0)
        }
        Node {
            id: gracilaria_Attachment1
            objectName: "gracilaria_Attachment1"
            position: Qt.vector3d(-0.00884061, 0.001, -0.006762)
        }
        Node {
            id: gracilaria_Attachment2
            objectName: "gracilaria_Attachment2"
            position: Qt.vector3d(0.00102608, 0.001, 0.00996338)
        }
        Node {
            id: gracilaria_Attachment3
            objectName: "gracilaria_Attachment3"
            position: Qt.vector3d(0.00732875, 0.001, -0.00791839)
        }
        Node {
            id: gracilaria_Attachment4
            objectName: "gracilaria_Attachment4"
            position: Qt.vector3d(-0.0118245, 0.001, 0.00170387)
        }
        Node {
            id: gracilaria_Attachment5
            objectName: "gracilaria_Attachment5"
            position: Qt.vector3d(0.0100939, 0.001, 0.00540785)
        }
        Node {
            id: gracilaria_Attachment6
            objectName: "gracilaria_Attachment6"
            position: Qt.vector3d(-0.00304823, 0.001, -0.00967199)
        }
        Node {
            id: gracilaria_GroundContact
            objectName: "gracilaria_GroundContact"
        }
    }

    // Animations:
    Timeline {
        id: sway_timeline
        objectName: "Sway"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 6000
        currentFrame: node.poseTimeMs
        enabled: true
        animations: TimelineAnimation {
            duration: 6000
            from: 0
            to: 6000
            running: node.animate
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: gracilaria_Frond6_2
            property: "position"
            keyframeSource: "animations/gracilaria_Frond6_2_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond6_2
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond6_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond6_1
            property: "position"
            keyframeSource: "animations/gracilaria_Frond6_1_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond6_1
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond6_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond6_0
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond6_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond5_2
            property: "position"
            keyframeSource: "animations/gracilaria_Frond5_2_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond5_2
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond5_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond5_1
            property: "position"
            keyframeSource: "animations/gracilaria_Frond5_1_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond5_1
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond5_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond5_0
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond5_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond4_2
            property: "position"
            keyframeSource: "animations/gracilaria_Frond4_2_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond4_2
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond4_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond4_1
            property: "position"
            keyframeSource: "animations/gracilaria_Frond4_1_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond4_1
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond4_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond4_0
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond4_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond2_0
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond2_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond0_0
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond0_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond0_1
            property: "position"
            keyframeSource: "animations/gracilaria_Frond0_1_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond0_1
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond0_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond0_2
            property: "position"
            keyframeSource: "animations/gracilaria_Frond0_2_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond0_2
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond0_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond1_0
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond1_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond1_1
            property: "position"
            keyframeSource: "animations/gracilaria_Frond1_1_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond1_1
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond1_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond1_2
            property: "position"
            keyframeSource: "animations/gracilaria_Frond1_2_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond1_2
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond1_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond2_1
            property: "position"
            keyframeSource: "animations/gracilaria_Frond2_1_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond2_1
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond2_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond2_2
            property: "position"
            keyframeSource: "animations/gracilaria_Frond2_2_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond2_2
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond2_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond3_0
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond3_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond3_1
            property: "position"
            keyframeSource: "animations/gracilaria_Frond3_1_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond3_1
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond3_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond3_2
            property: "position"
            keyframeSource: "animations/gracilaria_Frond3_2_position_0.qad"
        }
        KeyframeGroup {
            target: gracilaria_Frond3_2
            property: "rotation"
            keyframeSource: "animations/gracilaria_Frond3_2_rotation_0.qad"
        }
    }
}
