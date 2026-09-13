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
        id: halimeda_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        fragmentShader: "../../leaf.frag"
        vertexShader: "../../leaf.vert"
        property TextureInput leafMap: TextureInput { texture: _0_texture }
        property TextureInput leafSurface: TextureInput { texture: _1_texture }
        property TextureInput leafNormal: TextureInput { texture: _2_texture }
        property real pigmentLow: 0.15
        property real pigmentHigh: 0.58
        property real leafHeight: 0.1023
        property vector3d shadePigment: Qt.vector3d(0.04,0.14,0.035)
        property vector3d litPigment: Qt.vector3d(0.26,0.49,0.115)
    }
    Skin {
        id: skin
        joints: [
            root,
            halimeda_Fan0_0,
            halimeda_Fan0_1,
            halimeda_Fan0_2,
            halimeda_Branch0_2,
            halimeda_Fan0_3,
            halimeda_Fan0_4,
            halimeda_Branch0_4,
            halimeda_Fan0_5,
            halimeda_Fan1_0,
            halimeda_Fan1_1,
            halimeda_Fan1_2,
            halimeda_Branch1_2,
            halimeda_Fan1_3,
            halimeda_Fan1_4,
            halimeda_Branch1_4,
            halimeda_Fan1_5,
            halimeda_Fan2_0,
            halimeda_Fan2_1,
            halimeda_Fan2_2,
            halimeda_Branch2_2,
            halimeda_Fan2_3,
            halimeda_Fan2_4,
            halimeda_Branch2_4,
            halimeda_Fan2_5,
            halimeda_Fan3_0,
            halimeda_Fan3_1,
            halimeda_Fan3_2,
            halimeda_Branch3_2,
            halimeda_Fan3_3,
            halimeda_Fan3_4,
            halimeda_Branch3_4,
            halimeda_Fan3_5,
            halimeda_Fan4_0,
            halimeda_Fan4_1,
            halimeda_Fan4_2,
            halimeda_Branch4_2,
            halimeda_Fan4_3,
            halimeda_Fan4_4,
            halimeda_Branch4_4,
            halimeda_Fan4_5,
            halimeda_Fan5_0,
            halimeda_Fan5_1,
            halimeda_Fan5_2,
            halimeda_Branch5_2,
            halimeda_Fan5_3,
            halimeda_Fan5_4,
            halimeda_Branch5_4,
            halimeda_Fan5_5
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.944264, -0.229411, 0.236085, -0.0139345, 0.236085, 0.971732, 3.72529e-09, -0.00451301, -0.229411, 0.0557361, 0.971732, 0.00338544, 0, 0, 0, 1),
            Qt.matrix4x4(0.946543, -0.224942, 0.231207, -0.0143362, 0.231207, 0.972905, -7.45058e-09, -0.0223342, -0.224942, 0.0534566, 0.972905, 0.00340693, 0, 0, 0, 1),
            Qt.matrix4x4(0.945925, -0.226166, 0.23254, -0.0145471, 0.23254, 0.972587, -3.72529e-09, -0.0406504, -0.226166, 0.0540751, 0.972587, 0.00347815, 0, 0, 0, 1),
            Qt.matrix4x4(0.665836, 0.471697, -0.57807, -0.0362732, -0.578069, 0.815987, 1.04308e-07, -0.0246912, 0.471697, 0.334164, 0.815988, -0.025697, 0, 0, 0, 1),
            Qt.matrix4x4(0.919233, -0.272477, 0.284195, -0.0115719, 0.284195, 0.958766, 0, -0.059565, -0.272477, 0.0807671, 0.958767, 0.00343011, 0, 0, 0, 1),
            Qt.matrix4x4(0.914601, -0.279474, 0.292231, -0.0112726, 0.292231, 0.956348, 1.49012e-08, -0.0743502, -0.279474, 0.0853988, 0.956348, 0.00344456, 0, 0, 0, 1),
            Qt.matrix4x4(0.549531, -0.497541, 0.67117, 0.0182402, 0.67117, 0.741304, -4.47035e-08, -0.0793244, -0.497541, 0.450469, 0.741304, -0.0165145, 0, 0, 0, 1),
            Qt.matrix4x4(0.91464, -0.279416, 0.292163, -0.0116142, 0.292163, 0.956368, 1.49012e-08, -0.0886006, -0.279416, 0.0853595, 0.956369, 0.00354804, 0, 0, 0, 1),
            Qt.matrix4x4(0.970271, 0.15981, -0.181758, 0.00908757, -0.181758, 0.977034, -0.111218, -0.00388806, 0.15981, 0.140947, 0.977034, 0.00955312, 0, 0, 0, 1),
            Qt.matrix4x4(0.974196, 0.149915, -0.168727, 0.00964226, -0.168727, 0.980241, -0.103244, -0.0207439, 0.149915, 0.129049, 0.980241, 0.0098223, 0, 0, 0, 1),
            Qt.matrix4x4(0.967344, 0.166655, -0.190978, 0.00883287, -0.190978, 0.974613, -0.11686, -0.0395745, 0.166655, 0.149517, 0.974613, 0.00947432, 0, 0, 0, 1),
            Qt.matrix4x4(0.61687, 0.48615, -0.618975, -0.0170166, -0.618975, 0.78541, 7.45058e-08, -0.0471164, 0.48615, 0.38313, 0.785411, 0.00208653, 0, 0, 0, 1),
            Qt.matrix4x4(0.970448, 0.15938, -0.181185, 0.00961099, -0.181185, 0.97718, -0.110868, -0.0556054, 0.15938, 0.14042, 0.97718, 0.010005, 0, 0, 0, 1),
            Qt.matrix4x4(0.963448, 0.175165, -0.202697, 0.00820838, -0.202697, 0.971355, -0.124031, -0.0730703, 0.175165, 0.160583, 0.971355, 0.00909004, 0, 0, 0, 1),
            Qt.matrix4x4(0.586735, -0.49242, 0.642857, 0.0611156, 0.642857, 0.765986, -2.98023e-08, -0.0441329, -0.49242, 0.413265, 0.765986, -0.0301047, 0, 0, 0, 1),
            Qt.matrix4x4(0.973186, 0.152546, -0.172159, 0.0111172, -0.172159, 0.97942, -0.105344, -0.087743, 0.152546, 0.132158, 0.97942, 0.0111577, 0, 0, 0, 1),
            Qt.matrix4x4(0.999486, -0.0244257, 0.0207626, -0.00150575, 0.0207626, 0.986689, 0.161286, -0.00294167, -0.0244257, -0.160772, 0.986689, -0.0116048, 0, 0, 0, 1),
            Qt.matrix4x4(0.999177, -0.0313976, 0.0256623, -0.00148168, 0.0256623, 0.979593, 0.199348, -0.0207386, -0.0313976, -0.198525, 0.979593, -0.0109973, 0, 0, 0, 1),
            Qt.matrix4x4(0.999119, -0.0325718, 0.0264526, -0.00149634, 0.0264526, 0.978302, 0.205487, -0.0346281, -0.0325718, -0.204607, 0.978302, -0.0110179, 0, 0, 0, 1),
            Qt.matrix4x4(0.532509, 0.498942, -0.683733, -0.00721113, -0.683733, 0.729732, 4.47035e-08, -0.0284045, 0.498942, 0.467491, 0.729732, -0.0313328, 0, 0, 0, 1),
            Qt.matrix4x4(0.999244, -0.0300043, 0.0247118, -0.00161383, 0.0247118, 0.981091, 0.191965, -0.0478373, -0.0300043, -0.191209, 0.981091, -0.0119256, 0, 0, 0, 1),
            Qt.matrix4x4(0.999481, -0.0245577, 0.0208588, -0.00187797, 0.0208588, 0.986565, 0.162034, -0.0618252, -0.0245577, -0.161515, 0.986565, -0.0140438, 0, 0, 0, 1),
            Qt.matrix4x4(0.650719, -0.476743, 0.591, 0.0152174, 0.591, 0.806672, 0, -0.0578192, -0.476743, 0.349281, 0.806672, -0.0407918, 0, 0, 0, 1),
            Qt.matrix4x4(0.999313, -0.0285079, 0.0236755, -0.00168373, 0.0236755, 0.982657, 0.183914, -0.0793901, -0.0285079, -0.183227, 0.982657, -0.0124767, 0, 0, 0, 1),
            Qt.matrix4x4(0.970696, -0.154197, 0.184317, -0.00698691, 0.184317, 0.969869, -0.159317, -0.00417222, -0.154197, 0.188621, 0.969869, 0.0104397, 0, 0, 0, 1),
            Qt.matrix4x4(0.98155, -0.125747, 0.144037, -0.00818536, 0.144037, 0.981709, -0.124501, -0.0171947, -0.125747, 0.14295, 0.981709, 0.0111192, 0, 0, 0, 1),
            Qt.matrix4x4(0.977432, -0.137593, 0.160297, -0.00766753, 0.160297, 0.977296, -0.138555, -0.0353953, -0.137593, 0.161123, 0.977296, 0.0108237, 0, 0, 0, 1),
            Qt.matrix4x4(0.612289, 0.487228, -0.622664, -0.0363605, -0.622664, 0.782489, 8.9407e-08, -0.0238139, 0.487228, 0.387711, 0.782489, -0.0107187, 0, 0, 0, 1),
            Qt.matrix4x4(0.974288, -0.14571, 0.171846, -0.00720153, 0.171846, 0.973861, -0.148537, -0.051572, -0.14571, 0.174249, 0.973861, 0.0104797, 0, 0, 0, 1),
            Qt.matrix4x4(0.981046, -0.127281, 0.146106, -0.00913925, 0.146106, 0.981175, -0.126289, -0.0659059, -0.127281, 0.145242, 0.981175, 0.0122468, 0, 0, 0, 1),
            Qt.matrix4x4(0.657068, -0.474689, 0.585604, 0.0304272, 0.585604, 0.810597, -1.49012e-08, -0.0707856, -0.474689, 0.342932, 0.810597, 0.00146295, 0, 0, 0, 1),
            Qt.matrix4x4(0.983406, -0.119856, 0.13619, -0.0101445, 0.13619, 0.983664, -0.117718, -0.0833249, -0.119856, 0.134312, 0.983664, 0.0131675, 0, 0, 0, 1),
            Qt.matrix4x4(0.949644, 0.2216, -0.221518, 0.0142677, -0.221518, 0.974822, 0.0255359, -0.00430122, 0.2216, 0.0248203, 0.974822, 0.00125741, 0, 0, 0, 1),
            Qt.matrix4x4(0.937996, 0.244773, -0.245457, 0.0139234, -0.245457, 0.968994, 0.0282955, -0.0235032, 0.244773, 0.0337082, 0.968994, 0.0015757, 0, 0, 0, 1),
            Qt.matrix4x4(0.942535, 0.236069, -0.236429, 0.0146068, -0.236429, 0.971267, 0.0272547, -0.0402697, 0.236069, 0.03021, 0.971267, 0.00152795, 0, 0, 0, 1),
            Qt.matrix4x4(0.651143, 0.476609, -0.590641, -0.00297789, -0.590641, 0.806934, -4.47035e-08, -0.0515345, 0.476609, 0.348857, 0.806934, -0.00598044, 0, 0, 0, 1),
            Qt.matrix4x4(0.914829, 0.284138, -0.286973, 0.0117628, -0.286973, 0.957367, 0.0330813, -0.0585678, 0.284138, 0.0520898, 0.957367, 0.00181225, 0, 0, 0, 1),
            Qt.matrix4x4(0.934237, 0.251702, -0.252681, 0.0147428, -0.252681, 0.967111, 0.0291283, -0.0723846, 0.251702, 0.0366349, 0.967111, 0.0018037, 0, 0, 0, 1),
            Qt.matrix4x4(0.618345, -0.485792, 0.617782, 0.0528039, 0.617782, 0.78635, 1.49012e-08, -0.0401642, -0.485792, 0.381655, 0.78635, -0.0466848, 0, 0, 0, 1),
            Qt.matrix4x4(0.928908, 0.261132, -0.262565, 0.0141201, -0.262565, 0.96444, 0.0302676, -0.0889241, 0.261132, 0.0408245, 0.964439, 0.00186486, 0, 0, 0, 1),
            Qt.matrix4x4(0.958832, -0.207126, 0.194269, -0.0131515, 0.194269, 0.977408, 0.0832642, -0.00396892, -0.207126, -0.0420959, 0.977408, -0.00368732, 0, 0, 0, 1),
            Qt.matrix4x4(0.927306, -0.27448, 0.25449, -0.0121023, 0.25449, 0.960904, 0.109075, -0.0231666, -0.27448, -0.0363808, 0.960904, -0.00260689, 0, 0, 0, 1),
            Qt.matrix4x4(0.957527, -0.210379, 0.19719, -0.0145311, 0.19719, 0.976715, 0.084516, -0.0359964, -0.210379, -0.0420426, 0.976715, -0.0039177, 0, 0, 0, 1),
            Qt.matrix4x4(0.664125, 0.472295, -0.579547, -0.0261257, -0.579547, 0.814939, -7.45058e-08, -0.0234307, 0.472295, 0.335875, 0.814939, -0.030524, 0, 0, 0, 1),
            Qt.matrix4x4(0.948536, -0.231478, 0.216096, -0.0137386, 0.216096, 0.971969, 0.0926193, -0.0543306, -0.231478, -0.0411553, 0.971969, -0.00345234, 0, 0, 0, 1),
            Qt.matrix4x4(0.938317, -0.253188, 0.235494, -0.0125666, 0.235494, 0.96662, 0.100933, -0.0709776, -0.253188, -0.0392501, 0.96662, -0.00295409, 0, 0, 0, 1),
            Qt.matrix4x4(0.575888, -0.494207, 0.651239, 0.0106801, 0.651239, 0.758873, 5.96046e-08, -0.0750734, -0.494207, 0.424112, 0.758873, -0.0262681, 0, 0, 0, 1),
            Qt.matrix4x4(0.927588, -0.273958, 0.254025, -0.0111483, 0.254025, 0.96105, 0.108876, -0.0861481, -0.273958, -0.0364631, 0.96105, -0.00248669, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: foliage_Root
        objectName: "Foliage_Root"
        source: "meshes/foliage_SkinnedSurface_mesh.mesh"
        skin: skin
        materials: [
            halimeda_low_material
        ]
        Node {
            id: foliageRig
            objectName: "FoliageRig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: halimeda_Fan0_0
                    objectName: "halimeda_Fan0_0"
                    position: Qt.vector3d(0.015, 0.001, 0)
                    rotation: Qt.quaternion(0.985866, -0.0141338, -0.118043, -0.118043)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: halimeda_Fan0_1
                        objectName: "halimeda_Fan0_1"
                        position: Qt.vector3d(0.000275292, 0.0178948, -6.68831e-05)
                        rotation: Qt.quaternion(0.999994, 0.000586112, 0.00250857, 0.00243913)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: halimeda_Fan0_2
                            objectName: "halimeda_Fan0_2"
                            position: Qt.vector3d(0.000269932, 0.0182956, -6.41478e-05)
                            rotation: Qt.quaternion(1, -0.000158951, -0.000685535, -0.000666839)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: halimeda_Branch0_2
                                objectName: "halimeda_Branch0_2"
                                position: Qt.vector3d(-0.00410532, 0.00905354, 0.00098156)
                                rotation: Qt.quaternion(0.829597, -0.0782996, 0.375986, 0.405305)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: halimeda_Fan0_3
                                objectName: "halimeda_Fan0_3"
                                position: Qt.vector3d(0.000271398, 0.0181844, -6.48903e-05)
                                rotation: Qt.quaternion(0.999285, -0.00691018, -0.0267264, -0.0258275)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: halimeda_Fan0_4
                                    objectName: "halimeda_Fan0_4"
                                    position: Qt.vector3d(0.00032697, 0.0146837, -9.69196e-05)
                                    rotation: Qt.quaternion(0.999982, -0.00120927, -0.00419567, -0.00401769)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: halimeda_Branch0_4
                                        objectName: "halimeda_Branch0_4"
                                        position: Qt.vector3d(-0.000310964, 0.00790801, 9.50212e-05)
                                        rotation: Qt.quaternion(0.95254, -0.107522, -0.21262, -0.189469)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                    Node {
                                        id: halimeda_Fan0_5
                                        objectName: "halimeda_Fan0_5"
                                        position: Qt.vector3d(0.00033537, 0.0142512, -0.000102479)
                                        rotation: Qt.quaternion(1, 1.02866e-05, 3.51719e-05, 3.36694e-05)
                                    }
                                }
                            }
                        }
                    }
                }
                Node {
                    id: halimeda_Fan1_0
                    objectName: "halimeda_Fan1_0"
                    position: Qt.vector3d(-0.0110508, 0.001, -0.0081144)
                    rotation: Qt.quaternion(0.990497, -0.0636462, 0.086211, 0.086211)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: halimeda_Fan1_1
                        objectName: "halimeda_Fan1_1"
                        position: Qt.vector3d(-0.000191771, 0.0170674, -0.000169137)
                        rotation: Qt.quaternion(0.999951, 0.00512739, -0.0060126, -0.00588451)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: halimeda_Fan1_2
                            objectName: "halimeda_Fan1_2"
                            position: Qt.vector3d(-0.000179898, 0.0184722, -0.000154858)
                            rotation: Qt.quaternion(0.999858, -0.00880845, 0.0102526, 0.010023)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: halimeda_Branch1_2
                                objectName: "halimeda_Branch1_2"
                                position: Qt.vector3d(-0.000468524, 0.00895624, 0.000982082)
                                rotation: Qt.quaternion(0.946495, -0.046091, 0.214448, 0.236716)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: halimeda_Fan1_3
                                objectName: "halimeda_Fan1_3"
                                position: Qt.vector3d(-0.000199986, 0.0161897, -0.000179421)
                                rotation: Qt.quaternion(0.999973, 0.0039083, -0.00450434, -0.00439594)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: halimeda_Fan1_4
                                    objectName: "halimeda_Fan1_4"
                                    position: Qt.vector3d(-0.000191257, 0.0171248, -0.000168503)
                                    rotation: Qt.quaternion(0.999867, -0.00865063, 0.0098779, 0.00962533)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: halimeda_Branch1_4
                                        objectName: "halimeda_Branch1_4"
                                        position: Qt.vector3d(0.00337398, 0.00761926, 0.00167696)
                                        rotation: Qt.quaternion(0.819546, -0.052048, -0.367715, -0.436373)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                    Node {
                                        id: halimeda_Fan1_5
                                        objectName: "halimeda_Fan1_5"
                                        position: Qt.vector3d(-0.000210197, 0.01519, -0.000192699)
                                        rotation: Qt.quaternion(0.999733, 0.0122086, -0.0140394, -0.0136985)
                                    }
                                }
                            }
                        }
                    }
                }
                Node {
                    id: halimeda_Fan2_0
                    objectName: "halimeda_Fan2_0"
                    position: Qt.vector3d(0.0012826, 0.001, 0.0119561)
                    rotation: Qt.quaternion(0.996602, 0.0807891, -0.0113356, -0.0113356)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: halimeda_Fan2_1
                        objectName: "halimeda_Fan2_1"
                        position: Qt.vector3d(2.93108e-05, 0.0173483, 0.000192927)
                        rotation: Qt.quaternion(0.999805, 0.0192827, -0.0030397, -0.00298958)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: halimeda_Fan2_2
                            objectName: "halimeda_Fan2_2"
                            position: Qt.vector3d(3.76772e-05, 0.0138185, 0.000238231)
                            rotation: Qt.quaternion(0.999995, 0.00312264, -0.00050613, -0.000495477)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: halimeda_Branch2_2
                                objectName: "halimeda_Branch2_2"
                                position: Qt.vector3d(-0.00223926, 0.00718632, -0.0014489)
                                rotation: Qt.quaternion(0.835989, -0.223548, 0.386042, 0.319563)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: halimeda_Fan2_3
                                objectName: "halimeda_Fan2_3"
                                position: Qt.vector3d(3.90862e-05, 0.013372, 0.000245527)
                                rotation: Qt.quaternion(0.999975, -0.00687295, 0.00110877, 0.0010863)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: halimeda_Fan2_4
                                    objectName: "halimeda_Fan2_4"
                                    position: Qt.vector3d(3.60052e-05, 0.0143933, 0.000229454)
                                    rotation: Qt.quaternion(0.99988, -0.0151554, 0.00237917, 0.00234124)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: halimeda_Branch2_4
                                        objectName: "halimeda_Branch2_4"
                                        position: Qt.vector3d(0.00176656, 0.00937806, -0.00157761)
                                        rotation: Qt.quaternion(0.899125, -0.169652, -0.30928, -0.259109)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                    Node {
                                        id: halimeda_Fan2_5
                                        objectName: "halimeda_Fan2_5"
                                        position: Qt.vector3d(2.9469e-05, 0.017263, 0.000193817)
                                        rotation: Qt.quaternion(0.999936, 0.0110719, -0.00172945, -0.00170305)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                        }
                    }
                }
                Node {
                    id: halimeda_Fan3_0
                    objectName: "halimeda_Fan3_0"
                    position: Qt.vector3d(0.00916094, 0.001, -0.00950207)
                    rotation: Qt.quaternion(0.988741, -0.0879749, -0.085592, -0.085592)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: halimeda_Fan3_1
                        objectName: "halimeda_Fan3_1"
                        position: Qt.vector3d(0.000185035, 0.0137468, -0.000226344)
                        rotation: Qt.quaternion(0.999465, 0.0207982, 0.0180632, 0.0176389)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: halimeda_Fan3_2
                            objectName: "halimeda_Fan3_2"
                            position: Qt.vector3d(0.000150897, 0.0179023, -0.000171539)
                            rotation: Qt.quaternion(0.999913, -0.00828968, -0.00733439, -0.00718491)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: halimeda_Branch3_2
                                objectName: "halimeda_Branch3_2"
                                position: Qt.vector3d(-0.00315371, 0.00819456, 0.00167905)
                                rotation: Qt.quaternion(0.845087, -0.0404812, 0.343925, 0.407314)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: halimeda_Fan3_3
                                objectName: "halimeda_Fan3_3"
                                position: Qt.vector3d(0.000165112, 0.0159722, -0.000193347)
                                rotation: Qt.quaternion(0.999956, -0.00597563, -0.0051758, -0.00504975)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: halimeda_Fan3_4
                                    objectName: "halimeda_Fan3_4"
                                    position: Qt.vector3d(0.000174854, 0.0148241, -0.0002091)
                                    rotation: Qt.quaternion(0.999782, 0.0132179, 0.0115723, 0.0113155)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: halimeda_Branch3_4
                                        objectName: "halimeda_Branch3_4"
                                        position: Qt.vector3d(0.000740556, 0.00970872, 0.00113935)
                                        rotation: Qt.quaternion(0.945655, -0.0321353, -0.214907, -0.241906)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                    Node {
                                        id: halimeda_Fan3_5
                                        objectName: "halimeda_Fan3_5"
                                        position: Qt.vector3d(0.000152738, 0.0176328, -0.000174289)
                                        rotation: Qt.quaternion(0.999968, 0.00499699, 0.00449782, 0.00441894)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                        }
                    }
                }
                Node {
                    id: halimeda_Fan4_0
                    objectName: "halimeda_Fan4_0"
                    position: Qt.vector3d(-0.0147807, 0.001, 0.00204464)
                    rotation: Qt.quaternion(0.987331, 0.000181191, 0.112201, 0.112201)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: halimeda_Fan4_1
                        objectName: "halimeda_Fan4_1"
                        position: Qt.vector3d(-0.000265918, 0.0188475, -2.97845e-05)
                        rotation: Qt.quaternion(0.999843, -0.00153559, 0.0126542, 0.0123006)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: halimeda_Fan4_2
                            objectName: "halimeda_Fan4_2"
                            position: Qt.vector3d(-0.000293726, 0.0169023, -4.04492e-05)
                            rotation: Qt.quaternion(0.999978, 0.000616802, -0.00478608, -0.00464322)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: halimeda_Branch4_2
                                objectName: "halimeda_Branch4_2"
                                position: Qt.vector3d(0.000351054, 0.00967301, -0.00018598)
                                rotation: Qt.quaternion(0.961259, -0.0944587, 0.194107, 0.171409)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: halimeda_Fan4_3
                                objectName: "halimeda_Fan4_3"
                                position: Qt.vector3d(-0.000283284, 0.0175894, -3.62522e-05)
                                rotation: Qt.quaternion(0.999287, -0.0040529, 0.0270038, 0.0260583)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: halimeda_Fan4_4
                                    objectName: "halimeda_Fan4_4"
                                    position: Qt.vector3d(-0.000340969, 0.0143028, -6.25061e-05)
                                    rotation: Qt.quaternion(0.99967, 0.00290896, -0.0183851, -0.0176965)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: halimeda_Branch4_4
                                        objectName: "halimeda_Branch4_4"
                                        position: Qt.vector3d(0.00408978, 0.00802955, 0.000826715)
                                        rotation: Qt.quaternion(0.799357, -0.10335, -0.404007, -0.432581)
                                    }
                                    Node {
                                        id: halimeda_Fan4_5
                                        objectName: "halimeda_Fan4_5"
                                        position: Qt.vector3d(-0.000302041, 0.0163881, -4.39596e-05)
                                        rotation: Qt.quaternion(0.999973, -0.000768778, 0.00527371, 0.00509326)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                        }
                    }
                }
                Node {
                    id: halimeda_Fan5_0
                    objectName: "halimeda_Fan5_0"
                    position: Qt.vector3d(0.0126174, 0.001, 0.00648943)
                    rotation: Qt.quaternion(0.989147, 0.0316839, -0.10145, -0.10145)
                    Node {
                        id: halimeda_Fan5_1
                        objectName: "halimeda_Fan5_1"
                        position: Qt.vector3d(0.000248552, 0.0183115, 5.05159e-05)
                        rotation: Qt.quaternion(0.998839, 0.00558697, -0.0343389, -0.0333178)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: halimeda_Fan5_2
                            objectName: "halimeda_Fan5_2"
                            position: Qt.vector3d(0.000329379, 0.0137207, 4.36564e-05)
                            rotation: Qt.quaternion(0.998947, -0.00526644, 0.032711, 0.0317235)
                            Node {
                                id: halimeda_Branch5_2
                                objectName: "halimeda_Branch5_2"
                                position: Qt.vector3d(-0.00396612, 0.00912803, 1.08666e-05)
                                rotation: Qt.quaternion(0.834632, -0.120532, 0.379778, 0.380303)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: halimeda_Fan5_3
                                objectName: "halimeda_Fan5_3"
                                position: Qt.vector3d(0.000252454, 0.0180238, 5.04511e-05)
                                rotation: Qt.quaternion(0.999888, 0.00195815, -0.0106438, -0.0103718)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: halimeda_Fan5_4
                                    objectName: "halimeda_Fan5_4"
                                    position: Qt.vector3d(0.000277773, 0.01635, 4.93871e-05)
                                    rotation: Qt.quaternion(0.999879, 0.00178675, -0.0110772, -0.0107383)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: halimeda_Branch5_4
                                        objectName: "halimeda_Branch5_4"
                                        position: Qt.vector3d(-0.000168939, 0.00828055, -0.000823487)
                                        rotation: Qt.quaternion(0.941778, -0.14994, -0.237711, -0.184569)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                    Node {
                                        id: halimeda_Fan5_5
                                        objectName: "halimeda_Fan5_5"
                                        position: Qt.vector3d(0.000303827, 0.0149136, 4.71002e-05)
                                        rotation: Qt.quaternion(0.999888, 0.00149099, -0.0107386, -0.0103514)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        Node {
            id: halimeda_GroundContact
            objectName: "halimeda_GroundContact"
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
            target: halimeda_Fan5_5
            property: "position"
            keyframeSource: "animations/halimeda_Fan5_5_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_5
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan5_5_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch5_4
            property: "position"
            keyframeSource: "animations/halimeda_Branch5_4_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch5_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch5_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_4
            property: "position"
            keyframeSource: "animations/halimeda_Fan5_4_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan5_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_3
            property: "position"
            keyframeSource: "animations/halimeda_Fan5_3_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_3
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan5_3_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch5_2
            property: "position"
            keyframeSource: "animations/halimeda_Branch5_2_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch5_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch5_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_2
            property: "position"
            keyframeSource: "animations/halimeda_Fan5_2_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan5_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_1
            property: "position"
            keyframeSource: "animations/halimeda_Fan5_1_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_1
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan5_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan5_0
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan5_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_5
            property: "position"
            keyframeSource: "animations/halimeda_Fan4_5_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_5
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan4_5_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch4_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch4_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_4
            property: "position"
            keyframeSource: "animations/halimeda_Fan4_4_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan4_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_3
            property: "position"
            keyframeSource: "animations/halimeda_Fan4_3_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_3
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan4_3_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch4_2
            property: "position"
            keyframeSource: "animations/halimeda_Branch4_2_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch4_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch4_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_2
            property: "position"
            keyframeSource: "animations/halimeda_Fan4_2_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan4_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_1
            property: "position"
            keyframeSource: "animations/halimeda_Fan4_1_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_1
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan4_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan4_0
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan4_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_5
            property: "position"
            keyframeSource: "animations/halimeda_Fan3_5_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_5
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan3_5_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch3_4
            property: "position"
            keyframeSource: "animations/halimeda_Branch3_4_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch3_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch3_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_4
            property: "position"
            keyframeSource: "animations/halimeda_Fan3_4_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan3_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_3
            property: "position"
            keyframeSource: "animations/halimeda_Fan3_3_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_3
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan3_3_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch1_2
            property: "position"
            keyframeSource: "animations/halimeda_Branch1_2_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch1_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch1_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_0
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan1_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_5
            property: "position"
            keyframeSource: "animations/halimeda_Fan0_5_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_5
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan0_5_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_0
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan3_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_1
            property: "position"
            keyframeSource: "animations/halimeda_Fan1_1_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_1
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan1_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch0_4
            property: "position"
            keyframeSource: "animations/halimeda_Branch0_4_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch0_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch0_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_1
            property: "position"
            keyframeSource: "animations/halimeda_Fan3_1_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_1
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan3_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_4
            property: "position"
            keyframeSource: "animations/halimeda_Fan0_4_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan0_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_3
            property: "position"
            keyframeSource: "animations/halimeda_Fan0_3_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_3
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan0_3_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_2
            property: "position"
            keyframeSource: "animations/halimeda_Fan1_2_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan1_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch0_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch0_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_2
            property: "position"
            keyframeSource: "animations/halimeda_Fan3_2_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan3_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan3_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_2
            property: "position"
            keyframeSource: "animations/halimeda_Fan0_2_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan0_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_1
            property: "position"
            keyframeSource: "animations/halimeda_Fan0_1_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_1
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan0_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan0_0
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan0_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_4
            property: "position"
            keyframeSource: "animations/halimeda_Fan2_4_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan2_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_3
            property: "position"
            keyframeSource: "animations/halimeda_Fan1_3_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_3
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan1_3_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_4
            property: "position"
            keyframeSource: "animations/halimeda_Fan1_4_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan1_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch1_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch1_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_5
            property: "position"
            keyframeSource: "animations/halimeda_Fan1_5_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan1_5
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan1_5_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_0
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan2_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_1
            property: "position"
            keyframeSource: "animations/halimeda_Fan2_1_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_1
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan2_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_2
            property: "position"
            keyframeSource: "animations/halimeda_Fan2_2_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan2_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch2_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch2_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_3
            property: "position"
            keyframeSource: "animations/halimeda_Fan2_3_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_3
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan2_3_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch2_4
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch2_4_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_5
            property: "position"
            keyframeSource: "animations/halimeda_Fan2_5_position_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Fan2_5
            property: "rotation"
            keyframeSource: "animations/halimeda_Fan2_5_rotation_0.qad"
        }
        KeyframeGroup {
            target: halimeda_Branch3_2
            property: "rotation"
            keyframeSource: "animations/halimeda_Branch3_2_rotation_0.qad"
        }
    }
}
