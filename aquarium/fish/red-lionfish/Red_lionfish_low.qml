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
    property url textureData18: "maps/textureData18.png"
    property url textureData20: "maps/textureData20.png"
    property url textureData15: "maps/textureData15.png"
    property url textureData22: "maps/textureData22.png"
    property url textureData13: "maps/textureData13.png"
    property url textureData11: "maps/textureData11.png"
    property url textureData8: "maps/textureData8.png"
    property url textureData28: "maps/textureData28.png"
    property url textureData6: "maps/textureData6.png"
    property url textureData4: "maps/textureData4.png"
    property url textureData30: "maps/textureData30.png"
    Texture {
        id: _10_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData28
    }
    Texture {
        id: _0_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData4
    }
    Texture {
        id: _9_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData
    }
    Texture {
        id: _11_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData30
    }
    Texture {
        id: _8_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData22
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
        id: lionfish_eye_low_material
        objectName: "Lionfish_eye_low"
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
        id: mouth_interior_material
        objectName: "Mouth interior"
        baseColor: "#ff140301"
        roughness: 0.6000000238418579
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: lionfish_ray_low_material
        objectName: "Lionfish_ray_low"
        baseColorMap: _9_texture
        metalnessMap: _10_texture
        roughnessMap: _10_texture
        roughness: .90
        specularAmount: .38
        normalStrength: .70
        clearcoatAmount: .18
        clearcoatRoughnessAmount: .24
        normalMap: _11_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: lionfish_body_low_material
        objectName: "Lionfish_body_low"
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
        id: lionfish_fin_low_material
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
    Skin {
        id: skin
        joints: [
            root,
            chest,
            midBody,
            rearBody,
            peduncle,
            caudalFin,
            dorsalSpine11,
            dorsalSpine12,
            dorsalSpine13,
            softDorsal,
            analFin,
            dorsalSpine08,
            dorsalSpine09,
            dorsalSpine10,
            dorsalSpine01,
            dorsalSpine02,
            dorsalSpine03,
            dorsalSpine04,
            dorsalSpine05,
            dorsalSpine06,
            dorsalSpine07,
            pectoralL0,
            pectoralL0Tip,
            pectoralL1,
            pectoralL1Tip,
            pectoralL2,
            pectoralL2Tip,
            pelvicL,
            browL,
            pectoralR0,
            pectoralR0Tip,
            pectoralR1,
            pectoralR1Tip,
            pectoralR2,
            pectoralR2Tip,
            pelvicR,
            browR
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0687319, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0114553, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0272064, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0673, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.103098, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.999541, -0.0149213, 0.0263648, 0.00174041, 0.0263648, 0.857112, -0.514455, -0.0527197, -0.0149213, 0.514913, 0.857112, 0.0234338, 0, 0, 0, 1),
            Qt.matrix4x4(0.999756, -0.00998274, 0.0196812, 0.00139439, 0.0196812, 0.806762, -0.590549, -0.0568438, -0.00998274, 0.590793, 0.806762, 0.0275771, 0, 0, 0, 1),
            Qt.matrix4x4(0.999959, 0.00388639, -0.00822474, -0.00062045, -0.00822474, 0.772538, -0.634915, -0.059613, 0.00388639, 0.634957, 0.772538, 0.0334817, 0, 0, 0, 1),
            Qt.matrix4x4(1, -1.63156e-18, 2.53381e-18, 2.30172e-19, 2.53381e-18, 0.910366, -0.413803, -0.0471689, -1.63156e-18, 0.413803, 0.910366, 0.0678216, 0, 0, 0, 1),
            Qt.matrix4x4(0.999974, 0.00395648, 0.00594954, 0.000499743, 0.00594954, -0.922178, -0.38672, -0.0430946, 0.00395648, 0.386745, -0.922178, -0.0615034, 0, 0, 0, 1),
            Qt.matrix4x4(0.999902, 0.00873044, -0.0109594, -0.000539232, -0.0109594, 0.974647, -0.223478, -0.0430157, 0.00873044, 0.223577, 0.974647, 0.00776075, 0, 0, 0, 1),
            Qt.matrix4x4(0.999996, -0.00160888, 0.00226671, 0.000125013, 0.00226671, 0.943991, -0.329964, -0.0454279, -0.00160888, 0.329968, 0.943991, 0.0136998, 0, 0, 0, 1),
            Qt.matrix4x4(0.99978, -0.0111773, 0.0177402, 0.00107717, 0.0177402, 0.901931, -0.431515, -0.0489746, -0.0111773, 0.431735, 0.901931, 0.0186193, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.821682, 0.569946, -0.0483104, 0, -0.569946, 0.821682, -0.0309688, 0, 0, 0, 1),
            Qt.matrix4x4(0.999675, -0.0206921, 0.0149186, -5.33796e-05, 0.0149186, 0.948622, 0.316061, -0.0419422, -0.0206921, -0.315736, 0.948622, -0.0328184, 0, 0, 0, 1),
            Qt.matrix4x4(0.999661, -0.0200441, 0.0166298, 0.000108215, 0.0166298, 0.982647, 0.184738, -0.0403871, -0.0200441, -0.184398, 0.982647, -0.0281105, 0, 0, 0, 1),
            Qt.matrix4x4(0.999883, -0.0113186, 0.0102631, 0.000164647, 0.0102631, 0.99517, 0.0976333, -0.0398213, -0.0113186, -0.0975166, 0.99517, -0.0215629, 0, 0, 0, 1),
            Qt.matrix4x4(0.999999, 0.00087526, -0.000860389, -2.17387e-05, -0.000860389, 0.999853, 0.0171354, -0.0398683, 0.00087526, -0.0171347, 0.999853, -0.0143541, 0, 0, 0, 1),
            Qt.matrix4x4(0.999877, 0.0107418, -0.0114298, -0.000383998, -0.0114298, 0.998015, -0.0619298, -0.0399727, 0.0107418, 0.0620529, 0.998015, -0.00678911, 0, 0, 0, 1),
            Qt.matrix4x4(0.999774, 0.0139238, -0.0160579, -0.000669359, -0.0160579, 0.989806, -0.141514, -0.0411394, 0.0139238, 0.14174, 0.989806, 0.000617353, 0, 0, 0, 1),
            Qt.matrix4x4(0.712857, -0.268136, 0.648027, -0.0489879, 0.648027, 0.60513, -0.46247, 0.00674461, -0.268136, 0.749614, 0.60513, -0.00864102, 0, 0, 0, 1),
            Qt.matrix4x4(0.891129, -0.191725, 0.411254, -0.0615301, 0.411254, 0.724233, -0.553495, -0.0447639, -0.191725, 0.662365, 0.724233, -0.0126761, 0, 0, 0, 1),
            Qt.matrix4x4(0.558145, 0.115706, 0.821636, -0.0468544, 0.821636, -0.215157, -0.527846, -0.00444984, 0.115706, 0.969701, -0.215157, 0.0183363, 0, 0, 0, 1),
            Qt.matrix4x4(0.667683, 0.115577, 0.735419, -0.0531482, 0.735419, -0.255771, -0.627487, -0.04769, 0.115576, 0.959804, -0.255772, 0.0186739, 0, 0, 0, 1),
            Qt.matrix4x4(0.919083, 0.229487, 0.320346, -0.0339868, 0.320346, -0.90853, -0.268238, -0.0123265, 0.229487, 0.349154, -0.90853, 0.0357858, 0, 0, 0, 1),
            Qt.matrix4x4(0.993332, -0.0688717, -0.0924535, -0.0440478, -0.0924535, -0.954965, -0.281947, -0.0461327, -0.0688717, 0.288615, -0.954965, 0.0461104, 0, 0, 0, 1),
            Qt.matrix4x4(0.844563, 0.254351, 0.471188, -0.0224577, 0.471188, -0.771035, -0.428353, -0.0127718, 0.254351, 0.58379, -0.771035, 0.0490853, 0, 0, 0, 1),
            Qt.matrix4x4(0.959707, -0.221612, 0.172774, -0.0290566, 0.172774, 0.950255, 0.25916, -0.0314732, -0.221612, -0.218867, 0.950255, -0.0601209, 0, 0, 0, 1),
            Qt.matrix4x4(0.712857, 0.268136, -0.648027, 0.0489879, -0.648027, 0.60513, -0.46247, 0.00674461, 0.268136, 0.749614, 0.60513, -0.00864102, 0, 0, 0, 1),
            Qt.matrix4x4(0.891129, 0.191725, -0.411254, 0.0615301, -0.411254, 0.724233, -0.553495, -0.0447639, 0.191725, 0.662365, 0.724233, -0.0126761, 0, 0, 0, 1),
            Qt.matrix4x4(0.558145, -0.115706, -0.821636, 0.0468544, -0.821636, -0.215157, -0.527846, -0.00444984, -0.115706, 0.969701, -0.215157, 0.0183363, 0, 0, 0, 1),
            Qt.matrix4x4(0.667683, -0.115577, -0.735419, 0.0531482, -0.735419, -0.255771, -0.627487, -0.04769, -0.115576, 0.959804, -0.255772, 0.0186739, 0, 0, 0, 1),
            Qt.matrix4x4(0.919083, -0.229487, -0.320346, 0.0339868, -0.320346, -0.90853, -0.268238, -0.0123265, -0.229487, 0.349154, -0.90853, 0.0357858, 0, 0, 0, 1),
            Qt.matrix4x4(0.993332, 0.0688717, 0.0924535, 0.0440478, 0.0924535, -0.954965, -0.281947, -0.0461327, 0.0688717, 0.288615, -0.954965, 0.0461104, 0, 0, 0, 1),
            Qt.matrix4x4(0.844563, -0.254351, -0.471188, 0.0224577, -0.471188, -0.771035, -0.428353, -0.0127718, -0.254351, 0.58379, -0.771035, 0.0490853, 0, 0, 0, 1),
            Qt.matrix4x4(0.959707, 0.221612, -0.172774, 0.0290566, -0.172774, 0.950255, 0.25916, -0.0314732, 0.221612, -0.218867, 0.950255, -0.0601209, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: lionfish_Root
        objectName: "Lionfish_Root"
        source: "meshes/lionfish_Root_mesh.mesh"
        skin: skin
        materials: [
            lionfish_fin_low_material,
            lionfish_body_low_material,
            lionfish_fin_low_material,
            lionfish_eye_low_material,
            lionfish_eye_low_material,
            lionfish_body_low_material,
            lionfish_body_low_material,
            lionfish_body_low_material,
            mouth_interior_material,
            lionfish_fin_low_material,
            lionfish_fin_low_material,
            lionfish_fin_low_material,
            lionfish_fin_low_material,
            lionfish_fin_low_material,
            lionfish_ray_low_material,
            lionfish_fin_low_material
        ]
        Node {
            id: collision_Body_Ellipsoid
            objectName: "COLLISION_Body_Ellipsoid"
        }
        Node {
            id: lionfish_Rig
            objectName: "Lionfish_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: chest
                    objectName: "Chest"
                    position: Qt.vector3d(0, 0, 0.0687319)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: midBody
                        objectName: "MidBody"
                        position: Qt.vector3d(0, 0.0572766, 0)
                        Node {
                            id: rearBody
                            objectName: "RearBody"
                            position: Qt.vector3d(0, 0.0386617, 0)
                            Node {
                                id: peduncle
                                objectName: "Peduncle"
                                position: Qt.vector3d(0, 0.0400936, 0)
                                Node {
                                    id: caudalFin
                                    objectName: "CaudalFin"
                                    position: Qt.vector3d(0, 0.0357979, 0)
                                    Node {
                                        id: tail_Tip
                                        objectName: "Tail_Tip"
                                        position: Qt.vector3d(0, 0.0494011, 0)
                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                            Node {
                                id: dorsalSpine11
                                objectName: "DorsalSpine11"
                                position: Qt.vector3d(0, 0.0200468, 0.0331463)
                                rotation: Qt.quaternion(0.870188, 0.492487, -5.35127e-10, -0.0151489)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: dorsalSpine12
                                objectName: "DorsalSpine12"
                                position: Qt.vector3d(0, 0.0286383, 0.029581)
                                rotation: Qt.quaternion(0.891782, 0.452331, -5.2217e-10, -0.0110348)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: dorsalSpine13
                                objectName: "DorsalSpine13"
                                position: Qt.vector3d(0, 0.0365138, 0.0247962)
                                rotation: Qt.quaternion(0.904134, 0.427225, 0, 0.00454841)
                            }
                            Node {
                                id: softDorsal
                                objectName: "SoftDorsal"
                                position: Qt.vector3d(0, 0.0540548, 0.0148762)
                                rotation: Qt.quaternion(0.840774, 0.541386, 0, -1.50683e-18)
                            }
                            Node {
                                id: analFin
                                objectName: "AnalFin"
                                position: Qt.vector3d(0, 0.0461792, -0.0159567)
                                rotation: Qt.quaternion(0.832682, -0.553739, 0, -0.00357251)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                        Node {
                            id: dorsalSpine08
                            objectName: "DorsalSpine08"
                            position: Qt.vector3d(0, 0.0286383, 0.0401947)
                            rotation: Qt.quaternion(0.782138, 0.623066, 2.97685e-10, 0.00700603)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                        Node {
                            id: dorsalSpine09
                            objectName: "DorsalSpine09"
                            position: Qt.vector3d(0, 0.0393776, 0.0383632)
                            rotation: Qt.quaternion(0.815464, 0.578806, 3.56899e-11, -0.00138982)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                        Node {
                            id: dorsalSpine10
                            objectName: "DorsalSpine10"
                            position: Qt.vector3d(0, 0.0494011, 0.0361452)
                            rotation: Qt.quaternion(0.846025, 0.533041, 0, -0.0104845)
                        }
                    }
                    Node {
                        id: dorsalSpine01
                        objectName: "DorsalSpine01"
                        position: Qt.vector3d(0, 0.0157511, 0.0220453)
                        rotation: Qt.quaternion(0.46371, 0.885987, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: dorsalSpine02
                        objectName: "DorsalSpine02"
                        position: Qt.vector3d(0, 0.0243425, 0.0294242)
                        rotation: Qt.quaternion(0.584781, 0.811091, 7.963e-10, -0.0127557)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: dorsalSpine03
                        objectName: "DorsalSpine03"
                        position: Qt.vector3d(0, 0.03365, 0.0345049)
                        rotation: Qt.quaternion(0.63846, 0.769545, 0, -0.0130234)
                    }
                    Node {
                        id: dorsalSpine04
                        objectName: "DorsalSpine04"
                        position: Qt.vector3d(0, 0.043387, 0.037528)
                        rotation: Qt.quaternion(0.671702, 0.740782, 3.46628e-10, -0.00763959)
                    }
                    Node {
                        id: dorsalSpine05
                        objectName: "DorsalSpine05"
                        position: Qt.vector3d(0, 0.0536968, 0.0396165)
                        rotation: Qt.quaternion(0.701022, 0.713139, 6.22744e-11, 0.000613667)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: dorsalSpine06
                        objectName: "DorsalSpine06"
                        position: Qt.vector3d(0, 0.0644362, 0.0403188)
                        rotation: Qt.quaternion(0.728673, 0.684817, 0, 0.00784286)
                    }
                    Node {
                        id: dorsalSpine07
                        objectName: "DorsalSpine07"
                        position: Qt.vector3d(0, 0.0751755, 0.0406419)
                        rotation: Qt.quaternion(0.755485, 0.65508, 6.16374e-10, 0.0106275)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralL0
                        objectName: "PectoralL0"
                        position: Qt.vector3d(0.0282337, 0.0286383, -0.0107394)
                        rotation: Qt.quaternion(0.855123, 0.353826, 8.71288e-09, -0.378908)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralL0Tip
                            objectName: "PectoralL0Tip"
                            position: Qt.vector3d(2.79397e-09, 0.065702, 0)
                            rotation: Qt.quaternion(0.98743, 0.0395088, 0.073131, 0.134432)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pectoralL1
                        objectName: "PectoralL1"
                        position: Qt.vector3d(0.0276861, 0.0286383, -0.0133168)
                        rotation: Qt.quaternion(0.874027, -0.123084, 0, -0.470029)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralL1Tip
                            objectName: "PectoralL1Tip"
                            position: Qt.vector3d(-4.42378e-09, 0.0495523, 1.62981e-09)
                            rotation: Qt.quaternion(0.997485, -0.0128783, -0.0164632, 0.0677273)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pectoralL2
                        objectName: "PectoralL2"
                        position: Qt.vector3d(0.0269731, 0.0286383, -0.0158943)
                        rotation: Qt.quaternion(0.796316, -0.570459, -9.35631e-09, -0.201142)
                        Node {
                            id: pectoralL2Tip
                            objectName: "PectoralL2Tip"
                            position: Qt.vector3d(0, 0.0489831, -9.31323e-10)
                            rotation: Qt.quaternion(0.966144, -0.0182087, -0.152899, 0.207015)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicL
                        objectName: "PelvicL"
                        position: Qt.vector3d(0.0125, 0.0257745, -0.0327908)
                        rotation: Qt.quaternion(0.84509, -0.456186, 0, -0.27878)
                    }
                    Node {
                        id: browL
                        objectName: "BrowL"
                        position: Qt.vector3d(0.02, -0.0015751, 0.0103098)
                        rotation: Qt.quaternion(0.608621, 0.780662, 6.12087e-09, -0.141939)
                    }
                    Node {
                        id: pectoralR0
                        objectName: "PectoralR0"
                        position: Qt.vector3d(-0.0282337, 0.0286383, -0.0107394)
                        rotation: Qt.quaternion(0.855123, 0.353826, -8.71288e-09, 0.378908)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralR0Tip
                            objectName: "PectoralR0Tip"
                            position: Qt.vector3d(-2.79397e-09, 0.065702, 0)
                            rotation: Qt.quaternion(0.98743, 0.0395088, -0.073131, -0.134432)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pectoralR1
                        objectName: "PectoralR1"
                        position: Qt.vector3d(-0.0276861, 0.0286383, -0.0133168)
                        rotation: Qt.quaternion(0.874027, -0.123084, 0, 0.470029)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: pectoralR1Tip
                            objectName: "PectoralR1Tip"
                            position: Qt.vector3d(4.42378e-09, 0.0495523, 1.62981e-09)
                            rotation: Qt.quaternion(0.997485, -0.0128783, 0.0164632, -0.0677273)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pectoralR2
                        objectName: "PectoralR2"
                        position: Qt.vector3d(-0.0269731, 0.0286383, -0.0158943)
                        rotation: Qt.quaternion(0.796316, -0.570459, 9.35631e-09, 0.201142)
                        Node {
                            id: pectoralR2Tip
                            objectName: "PectoralR2Tip"
                            position: Qt.vector3d(0, 0.0489831, -9.31323e-10)
                            rotation: Qt.quaternion(0.966144, -0.0182087, 0.152899, -0.207015)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: pelvicR
                        objectName: "PelvicR"
                        position: Qt.vector3d(-0.0125, 0.0257745, -0.0327908)
                        rotation: Qt.quaternion(0.84509, -0.456186, 0, 0.27878)
                    }
                    Node {
                        id: browR
                        objectName: "BrowR"
                        position: Qt.vector3d(-0.02, -0.0015751, 0.0103098)
                        rotation: Qt.quaternion(0.608621, 0.780662, -6.12087e-09, 0.141939)
                    }
                    Node {
                        id: body_Axis
                        objectName: "Body_Axis"
                        position: Qt.vector3d(0, 0.0687319, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.0287692, -0.0186149)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralL_Attachment
                        objectName: "PectoralL_Attachment"
                        position: Qt.vector3d(0.0276861, 0.0286383, -0.0133168)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pectoralR_Attachment
                        objectName: "PectoralR_Attachment"
                        position: Qt.vector3d(-0.0276861, 0.0286383, -0.0133168)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvicL_Attachment
                        objectName: "PelvicL_Attachment"
                        position: Qt.vector3d(0.0125, 0.0257745, -0.0327908)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: pelvicR_Attachment
                        objectName: "PelvicR_Attachment"
                        position: Qt.vector3d(-0.0125, 0.0257745, -0.0327908)
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
        endFrame: 6000
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Idle"
        animations: TimelineAnimation {
            duration: 6000
            from: 0
            to: 6000
            running: node.animate && node.clip === "Idle"
            loops: -1
        }
        KeyframeGroup {
            target: root
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0, 0) }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 6000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0687319) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0, 0.0687319) }
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
            Keyframe { frame: 6000; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
        }
        KeyframeGroup {
            target: midBody
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0572766, 0) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0.0572766, 0) }
        }
        KeyframeGroup {
            target: dorsalSpine01
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0157511, 0.0220453) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0.0157511, 0.0220453) }
        }
        KeyframeGroup {
            target: dorsalSpine02
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0243425, 0.0294242) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0.0243425, 0.0294242) }
        }
        KeyframeGroup {
            target: dorsalSpine03
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.03365, 0.0345049) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0.03365, 0.0345049) }
        }
        KeyframeGroup {
            target: dorsalSpine04
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.043387, 0.037528) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0.043387, 0.037528) }
        }
        KeyframeGroup {
            target: dorsalSpine05
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0536968, 0.0396165) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0.0536968, 0.0396165) }
        }
        KeyframeGroup {
            target: dorsalSpine06
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0644362, 0.0403188) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0.0644362, 0.0403188) }
        }
        KeyframeGroup {
            target: dorsalSpine07
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0751755, 0.0406419) }
            Keyframe { frame: 6000; value: Qt.vector3d(0, 0.0751755, 0.0406419) }
        }
        KeyframeGroup {
            target: pectoralL0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0282337, 0.0286383, -0.0107394) }
            Keyframe { frame: 6000; value: Qt.vector3d(0.0282337, 0.0286383, -0.0107394) }
        }
        KeyframeGroup {
            target: pectoralL1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0276861, 0.0286383, -0.0133168) }
            Keyframe { frame: 6000; value: Qt.vector3d(0.0276861, 0.0286383, -0.0133168) }
        }
        KeyframeGroup {
            target: pectoralL2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0269731, 0.0286383, -0.0158943) }
            Keyframe { frame: 6000; value: Qt.vector3d(0.0269731, 0.0286383, -0.0158943) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0125, 0.0257745, -0.0327908) }
            Keyframe { frame: 6000; value: Qt.vector3d(0.0125, 0.0257745, -0.0327908) }
        }
        KeyframeGroup {
            target: browL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.02, -0.0015751, 0.0103098) }
            Keyframe { frame: 6000; value: Qt.vector3d(0.02, -0.0015751, 0.0103098) }
        }
        KeyframeGroup {
            target: pectoralR0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0282337, 0.0286383, -0.0107394) }
            Keyframe { frame: 6000; value: Qt.vector3d(-0.0282337, 0.0286383, -0.0107394) }
        }
        KeyframeGroup {
            target: pectoralR1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0276861, 0.0286383, -0.0133168) }
            Keyframe { frame: 6000; value: Qt.vector3d(-0.0276861, 0.0286383, -0.0133168) }
        }
        KeyframeGroup {
            target: pectoralR2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0269731, 0.0286383, -0.0158943) }
            Keyframe { frame: 6000; value: Qt.vector3d(-0.0269731, 0.0286383, -0.0158943) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0125, 0.0257745, -0.0327908) }
            Keyframe { frame: 6000; value: Qt.vector3d(-0.0125, 0.0257745, -0.0327908) }
        }
        KeyframeGroup {
            target: browR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.02, -0.0015751, 0.0103098) }
            Keyframe { frame: 6000; value: Qt.vector3d(-0.02, -0.0015751, 0.0103098) }
        }
        KeyframeGroup {
            target: browR
            property: "rotation"
            keyframeSource: "animations/browR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "animations/pelvicR_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR2Tip
            property: "position"
            keyframeSource: "animations/pectoralR2Tip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralR2Tip
            property: "rotation"
            keyframeSource: "animations/pectoralR2Tip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR2
            property: "rotation"
            keyframeSource: "animations/pectoralR2_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR1Tip
            property: "position"
            keyframeSource: "animations/pectoralR1Tip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralR1Tip
            property: "rotation"
            keyframeSource: "animations/pectoralR1Tip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR1
            property: "rotation"
            keyframeSource: "animations/pectoralR1_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR0Tip
            property: "position"
            keyframeSource: "animations/pectoralR0Tip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralR0Tip
            property: "rotation"
            keyframeSource: "animations/pectoralR0Tip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralR0
            property: "rotation"
            keyframeSource: "animations/pectoralR0_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine09
            property: "position"
            keyframeSource: "animations/dorsalSpine09_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine09
            property: "rotation"
            keyframeSource: "animations/dorsalSpine09_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine08
            property: "position"
            keyframeSource: "animations/dorsalSpine08_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine08
            property: "rotation"
            keyframeSource: "animations/dorsalSpine08_rotation_0.qad"
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
            target: softDorsal
            property: "position"
            keyframeSource: "animations/softDorsal_position_0.qad"
        }
        KeyframeGroup {
            target: softDorsal
            property: "rotation"
            keyframeSource: "animations/softDorsal_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine13
            property: "position"
            keyframeSource: "animations/dorsalSpine13_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine13
            property: "rotation"
            keyframeSource: "animations/dorsalSpine13_rotation_0.qad"
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
            target: midBody
            property: "rotation"
            keyframeSource: "animations/midBody_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine11
            property: "position"
            keyframeSource: "animations/dorsalSpine11_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine11
            property: "rotation"
            keyframeSource: "animations/dorsalSpine11_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine01
            property: "rotation"
            keyframeSource: "animations/dorsalSpine01_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine12
            property: "position"
            keyframeSource: "animations/dorsalSpine12_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine12
            property: "rotation"
            keyframeSource: "animations/dorsalSpine12_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine02
            property: "rotation"
            keyframeSource: "animations/dorsalSpine02_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine10
            property: "position"
            keyframeSource: "animations/dorsalSpine10_position_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine10
            property: "rotation"
            keyframeSource: "animations/dorsalSpine10_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine03
            property: "rotation"
            keyframeSource: "animations/dorsalSpine03_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine04
            property: "rotation"
            keyframeSource: "animations/dorsalSpine04_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine05
            property: "rotation"
            keyframeSource: "animations/dorsalSpine05_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine06
            property: "rotation"
            keyframeSource: "animations/dorsalSpine06_rotation_0.qad"
        }
        KeyframeGroup {
            target: dorsalSpine07
            property: "rotation"
            keyframeSource: "animations/dorsalSpine07_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL0
            property: "rotation"
            keyframeSource: "animations/pectoralL0_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL0Tip
            property: "position"
            keyframeSource: "animations/pectoralL0Tip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralL0Tip
            property: "rotation"
            keyframeSource: "animations/pectoralL0Tip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL1
            property: "rotation"
            keyframeSource: "animations/pectoralL1_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL1Tip
            property: "position"
            keyframeSource: "animations/pectoralL1Tip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralL1Tip
            property: "rotation"
            keyframeSource: "animations/pectoralL1Tip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL2
            property: "rotation"
            keyframeSource: "animations/pectoralL2_rotation_0.qad"
        }
        KeyframeGroup {
            target: pectoralL2Tip
            property: "position"
            keyframeSource: "animations/pectoralL2Tip_position_0.qad"
        }
        KeyframeGroup {
            target: pectoralL2Tip
            property: "rotation"
            keyframeSource: "animations/pectoralL2Tip_rotation_0.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "animations/pelvicL_rotation_0.qad"
        }
        KeyframeGroup {
            target: browL
            property: "rotation"
            keyframeSource: "animations/browL_rotation_0.qad"
        }
    }
    Timeline {
        id: swim_timeline
        objectName: "Swim"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 3000
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Swim"
        animations: TimelineAnimation {
            duration: 3000
            from: 0
            to: 3000
            running: node.animate && node.clip === "Swim"
            loops: -1
        }
        KeyframeGroup {
            target: root
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0, 0) }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0687319) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0, 0.0687319) }
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
        }
        KeyframeGroup {
            target: midBody
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0572766, 0) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0.0572766, 0) }
        }
        KeyframeGroup {
            target: dorsalSpine01
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0157511, 0.0220453) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0.0157511, 0.0220453) }
        }
        KeyframeGroup {
            target: dorsalSpine02
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0243425, 0.0294242) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0.0243425, 0.0294242) }
        }
        KeyframeGroup {
            target: dorsalSpine03
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.03365, 0.0345049) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0.03365, 0.0345049) }
        }
        KeyframeGroup {
            target: dorsalSpine04
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.043387, 0.037528) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0.043387, 0.037528) }
        }
        KeyframeGroup {
            target: dorsalSpine05
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0536968, 0.0396165) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0.0536968, 0.0396165) }
        }
        KeyframeGroup {
            target: dorsalSpine06
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0644362, 0.0403188) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0.0644362, 0.0403188) }
        }
        KeyframeGroup {
            target: dorsalSpine07
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0751755, 0.0406419) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0.0751755, 0.0406419) }
        }
        KeyframeGroup {
            target: pectoralL0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0282337, 0.0286383, -0.0107394) }
            Keyframe { frame: 3000; value: Qt.vector3d(0.0282337, 0.0286383, -0.0107394) }
        }
        KeyframeGroup {
            target: pectoralL1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0276861, 0.0286383, -0.0133168) }
            Keyframe { frame: 3000; value: Qt.vector3d(0.0276861, 0.0286383, -0.0133168) }
        }
        KeyframeGroup {
            target: pectoralL2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0269731, 0.0286383, -0.0158943) }
            Keyframe { frame: 3000; value: Qt.vector3d(0.0269731, 0.0286383, -0.0158943) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0125, 0.0257745, -0.0327908) }
            Keyframe { frame: 3000; value: Qt.vector3d(0.0125, 0.0257745, -0.0327908) }
        }
        KeyframeGroup {
            target: browL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.02, -0.0015751, 0.0103098) }
            Keyframe { frame: 3000; value: Qt.vector3d(0.02, -0.0015751, 0.0103098) }
        }
        KeyframeGroup {
            target: pectoralR0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0282337, 0.0286383, -0.0107394) }
            Keyframe { frame: 3000; value: Qt.vector3d(-0.0282337, 0.0286383, -0.0107394) }
        }
        KeyframeGroup {
            target: pectoralR1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0276861, 0.0286383, -0.0133168) }
            Keyframe { frame: 3000; value: Qt.vector3d(-0.0276861, 0.0286383, -0.0133168) }
        }
        KeyframeGroup {
            target: pectoralR2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0269731, 0.0286383, -0.0158943) }
            Keyframe { frame: 3000; value: Qt.vector3d(-0.0269731, 0.0286383, -0.0158943) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0125, 0.0257745, -0.0327908) }
            Keyframe { frame: 3000; value: Qt.vector3d(-0.0125, 0.0257745, -0.0327908) }
        }
        KeyframeGroup {
            target: browR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.02, -0.0015751, 0.0103098) }
            Keyframe { frame: 3000; value: Qt.vector3d(-0.02, -0.0015751, 0.0103098) }
        }
        KeyframeGroup {
            target: browR
            property: "rotation"
            keyframeSource: "animations/browR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "animations/pelvicR_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR2Tip
            property: "position"
            keyframeSource: "animations/pectoralR2Tip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralR2Tip
            property: "rotation"
            keyframeSource: "animations/pectoralR2Tip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR2
            property: "rotation"
            keyframeSource: "animations/pectoralR2_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR1Tip
            property: "position"
            keyframeSource: "animations/pectoralR1Tip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralR1Tip
            property: "rotation"
            keyframeSource: "animations/pectoralR1Tip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR1
            property: "rotation"
            keyframeSource: "animations/pectoralR1_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR0Tip
            property: "position"
            keyframeSource: "animations/pectoralR0Tip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralR0Tip
            property: "rotation"
            keyframeSource: "animations/pectoralR0Tip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralR0
            property: "rotation"
            keyframeSource: "animations/pectoralR0_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine09
            property: "position"
            keyframeSource: "animations/dorsalSpine09_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine09
            property: "rotation"
            keyframeSource: "animations/dorsalSpine09_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine08
            property: "position"
            keyframeSource: "animations/dorsalSpine08_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine08
            property: "rotation"
            keyframeSource: "animations/dorsalSpine08_rotation_1.qad"
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
            target: softDorsal
            property: "position"
            keyframeSource: "animations/softDorsal_position_1.qad"
        }
        KeyframeGroup {
            target: softDorsal
            property: "rotation"
            keyframeSource: "animations/softDorsal_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine13
            property: "position"
            keyframeSource: "animations/dorsalSpine13_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine13
            property: "rotation"
            keyframeSource: "animations/dorsalSpine13_rotation_1.qad"
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
            target: midBody
            property: "rotation"
            keyframeSource: "animations/midBody_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine11
            property: "position"
            keyframeSource: "animations/dorsalSpine11_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine11
            property: "rotation"
            keyframeSource: "animations/dorsalSpine11_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine01
            property: "rotation"
            keyframeSource: "animations/dorsalSpine01_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine12
            property: "position"
            keyframeSource: "animations/dorsalSpine12_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine12
            property: "rotation"
            keyframeSource: "animations/dorsalSpine12_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine02
            property: "rotation"
            keyframeSource: "animations/dorsalSpine02_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine10
            property: "position"
            keyframeSource: "animations/dorsalSpine10_position_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine10
            property: "rotation"
            keyframeSource: "animations/dorsalSpine10_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine03
            property: "rotation"
            keyframeSource: "animations/dorsalSpine03_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine04
            property: "rotation"
            keyframeSource: "animations/dorsalSpine04_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine05
            property: "rotation"
            keyframeSource: "animations/dorsalSpine05_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine06
            property: "rotation"
            keyframeSource: "animations/dorsalSpine06_rotation_1.qad"
        }
        KeyframeGroup {
            target: dorsalSpine07
            property: "rotation"
            keyframeSource: "animations/dorsalSpine07_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL0
            property: "rotation"
            keyframeSource: "animations/pectoralL0_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL0Tip
            property: "position"
            keyframeSource: "animations/pectoralL0Tip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralL0Tip
            property: "rotation"
            keyframeSource: "animations/pectoralL0Tip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL1
            property: "rotation"
            keyframeSource: "animations/pectoralL1_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL1Tip
            property: "position"
            keyframeSource: "animations/pectoralL1Tip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralL1Tip
            property: "rotation"
            keyframeSource: "animations/pectoralL1Tip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL2
            property: "rotation"
            keyframeSource: "animations/pectoralL2_rotation_1.qad"
        }
        KeyframeGroup {
            target: pectoralL2Tip
            property: "position"
            keyframeSource: "animations/pectoralL2Tip_position_1.qad"
        }
        KeyframeGroup {
            target: pectoralL2Tip
            property: "rotation"
            keyframeSource: "animations/pectoralL2Tip_rotation_1.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "animations/pelvicL_rotation_1.qad"
        }
        KeyframeGroup {
            target: browL
            property: "rotation"
            keyframeSource: "animations/browL_rotation_1.qad"
        }
    }
    Timeline {
        id: burst_timeline
        objectName: "Burst"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1500
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Burst"
        animations: TimelineAnimation {
            duration: 1500
            from: 0
            to: 1500
            running: node.animate && node.clip === "Burst"
            loops: -1
        }
        KeyframeGroup {
            target: root
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0, 0) }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1500; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.0687319) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0, 0.0687319) }
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
            Keyframe { frame: 1500; value: Qt.quaternion(0.707107, -0.707107, 0, 0) }
        }
        KeyframeGroup {
            target: midBody
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0572766, 0) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0.0572766, 0) }
        }
        KeyframeGroup {
            target: dorsalSpine01
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0157511, 0.0220453) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0.0157511, 0.0220453) }
        }
        KeyframeGroup {
            target: dorsalSpine02
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0243425, 0.0294242) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0.0243425, 0.0294242) }
        }
        KeyframeGroup {
            target: dorsalSpine03
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.03365, 0.0345049) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0.03365, 0.0345049) }
        }
        KeyframeGroup {
            target: dorsalSpine04
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.043387, 0.037528) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0.043387, 0.037528) }
        }
        KeyframeGroup {
            target: dorsalSpine05
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0536968, 0.0396165) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0.0536968, 0.0396165) }
        }
        KeyframeGroup {
            target: dorsalSpine06
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0644362, 0.0403188) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0.0644362, 0.0403188) }
        }
        KeyframeGroup {
            target: dorsalSpine07
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0751755, 0.0406419) }
            Keyframe { frame: 1500; value: Qt.vector3d(0, 0.0751755, 0.0406419) }
        }
        KeyframeGroup {
            target: pectoralL0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0282337, 0.0286383, -0.0107394) }
            Keyframe { frame: 1500; value: Qt.vector3d(0.0282337, 0.0286383, -0.0107394) }
        }
        KeyframeGroup {
            target: pectoralL1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0276861, 0.0286383, -0.0133168) }
            Keyframe { frame: 1500; value: Qt.vector3d(0.0276861, 0.0286383, -0.0133168) }
        }
        KeyframeGroup {
            target: pectoralL2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0269731, 0.0286383, -0.0158943) }
            Keyframe { frame: 1500; value: Qt.vector3d(0.0269731, 0.0286383, -0.0158943) }
        }
        KeyframeGroup {
            target: pelvicL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0125, 0.0257745, -0.0327908) }
            Keyframe { frame: 1500; value: Qt.vector3d(0.0125, 0.0257745, -0.0327908) }
        }
        KeyframeGroup {
            target: browL
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.02, -0.0015751, 0.0103098) }
            Keyframe { frame: 1500; value: Qt.vector3d(0.02, -0.0015751, 0.0103098) }
        }
        KeyframeGroup {
            target: pectoralR0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0282337, 0.0286383, -0.0107394) }
            Keyframe { frame: 1500; value: Qt.vector3d(-0.0282337, 0.0286383, -0.0107394) }
        }
        KeyframeGroup {
            target: pectoralR1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0276861, 0.0286383, -0.0133168) }
            Keyframe { frame: 1500; value: Qt.vector3d(-0.0276861, 0.0286383, -0.0133168) }
        }
        KeyframeGroup {
            target: pectoralR2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0269731, 0.0286383, -0.0158943) }
            Keyframe { frame: 1500; value: Qt.vector3d(-0.0269731, 0.0286383, -0.0158943) }
        }
        KeyframeGroup {
            target: pelvicR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0125, 0.0257745, -0.0327908) }
            Keyframe { frame: 1500; value: Qt.vector3d(-0.0125, 0.0257745, -0.0327908) }
        }
        KeyframeGroup {
            target: browR
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.02, -0.0015751, 0.0103098) }
            Keyframe { frame: 1500; value: Qt.vector3d(-0.02, -0.0015751, 0.0103098) }
        }
        KeyframeGroup {
            target: browR
            property: "rotation"
            keyframeSource: "animations/browR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pelvicR
            property: "rotation"
            keyframeSource: "animations/pelvicR_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR2Tip
            property: "position"
            keyframeSource: "animations/pectoralR2Tip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralR2Tip
            property: "rotation"
            keyframeSource: "animations/pectoralR2Tip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR2
            property: "rotation"
            keyframeSource: "animations/pectoralR2_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR1Tip
            property: "position"
            keyframeSource: "animations/pectoralR1Tip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralR1Tip
            property: "rotation"
            keyframeSource: "animations/pectoralR1Tip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR1
            property: "rotation"
            keyframeSource: "animations/pectoralR1_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR0Tip
            property: "position"
            keyframeSource: "animations/pectoralR0Tip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralR0Tip
            property: "rotation"
            keyframeSource: "animations/pectoralR0Tip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralR0
            property: "rotation"
            keyframeSource: "animations/pectoralR0_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine09
            property: "position"
            keyframeSource: "animations/dorsalSpine09_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine09
            property: "rotation"
            keyframeSource: "animations/dorsalSpine09_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine08
            property: "position"
            keyframeSource: "animations/dorsalSpine08_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine08
            property: "rotation"
            keyframeSource: "animations/dorsalSpine08_rotation_2.qad"
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
            target: softDorsal
            property: "position"
            keyframeSource: "animations/softDorsal_position_2.qad"
        }
        KeyframeGroup {
            target: softDorsal
            property: "rotation"
            keyframeSource: "animations/softDorsal_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine13
            property: "position"
            keyframeSource: "animations/dorsalSpine13_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine13
            property: "rotation"
            keyframeSource: "animations/dorsalSpine13_rotation_2.qad"
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
            target: midBody
            property: "rotation"
            keyframeSource: "animations/midBody_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine11
            property: "position"
            keyframeSource: "animations/dorsalSpine11_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine11
            property: "rotation"
            keyframeSource: "animations/dorsalSpine11_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine01
            property: "rotation"
            keyframeSource: "animations/dorsalSpine01_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine12
            property: "position"
            keyframeSource: "animations/dorsalSpine12_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine12
            property: "rotation"
            keyframeSource: "animations/dorsalSpine12_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine02
            property: "rotation"
            keyframeSource: "animations/dorsalSpine02_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine10
            property: "position"
            keyframeSource: "animations/dorsalSpine10_position_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine10
            property: "rotation"
            keyframeSource: "animations/dorsalSpine10_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine03
            property: "rotation"
            keyframeSource: "animations/dorsalSpine03_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine04
            property: "rotation"
            keyframeSource: "animations/dorsalSpine04_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine05
            property: "rotation"
            keyframeSource: "animations/dorsalSpine05_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine06
            property: "rotation"
            keyframeSource: "animations/dorsalSpine06_rotation_2.qad"
        }
        KeyframeGroup {
            target: dorsalSpine07
            property: "rotation"
            keyframeSource: "animations/dorsalSpine07_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL0
            property: "rotation"
            keyframeSource: "animations/pectoralL0_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL0Tip
            property: "position"
            keyframeSource: "animations/pectoralL0Tip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralL0Tip
            property: "rotation"
            keyframeSource: "animations/pectoralL0Tip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL1
            property: "rotation"
            keyframeSource: "animations/pectoralL1_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL1Tip
            property: "position"
            keyframeSource: "animations/pectoralL1Tip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralL1Tip
            property: "rotation"
            keyframeSource: "animations/pectoralL1Tip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL2
            property: "rotation"
            keyframeSource: "animations/pectoralL2_rotation_2.qad"
        }
        KeyframeGroup {
            target: pectoralL2Tip
            property: "position"
            keyframeSource: "animations/pectoralL2Tip_position_2.qad"
        }
        KeyframeGroup {
            target: pectoralL2Tip
            property: "rotation"
            keyframeSource: "animations/pectoralL2Tip_rotation_2.qad"
        }
        KeyframeGroup {
            target: pelvicL
            property: "rotation"
            keyframeSource: "animations/pelvicL_rotation_2.qad"
        }
        KeyframeGroup {
            target: browL
            property: "rotation"
            keyframeSource: "animations/browL_rotation_2.qad"
        }
    }
}
