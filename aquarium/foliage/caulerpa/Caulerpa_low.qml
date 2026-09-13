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
        id: caulerpa_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        fragmentShader: "../../leaf.frag"
        vertexShader: "../../leaf.vert"
        property TextureInput leafMap: TextureInput { texture: _0_texture }
        property TextureInput leafSurface: TextureInput { texture: _1_texture }
        property TextureInput leafNormal: TextureInput { texture: _2_texture }
        property real pigmentLow: 0.18
        property real pigmentHigh: 0.57
        property real leafHeight: 0.164
        property vector3d shadePigment: Qt.vector3d(0.025,0.11,0.004)
        property vector3d litPigment: Qt.vector3d(0.46,0.8,0.045)
    }
    Skin {
        id: skin
        joints: [
            root,
            caulerpa_Blade00_0,
            caulerpa_Blade00_1,
            caulerpa_Blade00_2,
            caulerpa_Blade01_0,
            caulerpa_Blade01_1,
            caulerpa_Blade01_2,
            caulerpa_Blade02_0,
            caulerpa_Blade02_1,
            caulerpa_Blade02_2,
            caulerpa_Blade03_0,
            caulerpa_Blade03_1,
            caulerpa_Blade03_2,
            caulerpa_Blade04_0,
            caulerpa_Blade04_1,
            caulerpa_Blade04_2,
            caulerpa_Blade05_0,
            caulerpa_Blade05_1,
            caulerpa_Blade05_2,
            caulerpa_Blade06_0,
            caulerpa_Blade06_1,
            caulerpa_Blade06_2,
            caulerpa_Blade07_0,
            caulerpa_Blade07_1,
            caulerpa_Blade07_2,
            caulerpa_Blade08_0,
            caulerpa_Blade08_1,
            caulerpa_Blade08_2,
            caulerpa_Blade09_0,
            caulerpa_Blade09_1,
            caulerpa_Blade09_2,
            caulerpa_Blade10_0,
            caulerpa_Blade10_1,
            caulerpa_Blade10_2,
            caulerpa_Blade11_0,
            caulerpa_Blade11_1,
            caulerpa_Blade11_2,
            caulerpa_Blade12_0,
            caulerpa_Blade12_1,
            caulerpa_Blade12_2,
            caulerpa_Blade13_0,
            caulerpa_Blade13_1,
            caulerpa_Blade13_2,
            caulerpa_Blade14_0,
            caulerpa_Blade14_1,
            caulerpa_Blade14_2,
            caulerpa_Blade15_0,
            caulerpa_Blade15_1,
            caulerpa_Blade15_2
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.999654, -0.0188983, 0.0182752, 0.0300441, 0.0182752, 0.999265, 0.0336841, -0.0163327, -0.0188983, -0.0333385, 0.999265, -0.0140092, 0, 0, 0, 1),
            Qt.matrix4x4(0.996697, -0.0601967, 0.0545063, 0.0313927, 0.0545063, 0.993447, 0.100464, -0.047573, -0.0601967, -0.0971611, 0.993447, -0.0120746, 0, 0, 0, 1),
            Qt.matrix4x4(0.990335, -0.105696, 0.089807, 0.0341909, 0.089807, 0.982107, 0.165529, -0.0786459, -0.105696, -0.155863, 0.982107, -0.0084587, 0, 0, 0, 1),
            Qt.matrix4x4(0.998642, -0.0360117, 0.0376435, 0.0148241, 0.0376435, 0.998341, -0.0435783, -0.0179009, -0.0360117, 0.0449362, 0.998341, -0.0135751, 0, 0, 0, 1),
            Qt.matrix4x4(0.988996, -0.0972774, 0.111462, 0.0166509, 0.111462, 0.985356, -0.129035, -0.0416871, -0.0972774, 0.140038, 0.985356, -0.0185742, 0, 0, 0, 1),
            Qt.matrix4x4(0.972874, -0.14388, 0.181147, 0.0192835, 0.181147, 0.960838, -0.209706, -0.0652473, -0.14388, 0.236832, 0.960838, -0.0258123, 0, 0, 0, 1),
            Qt.matrix4x4(0.999485, -0.0224957, 0.0228802, 0.0111752, 0.0228802, 0.999599, -0.0166851, -0.0174872, -0.0224957, 0.0172, 0.999599, -0.00943859, 0, 0, 0, 1),
            Qt.matrix4x4(0.995541, -0.0649359, 0.0684216, 0.0135998, 0.0684216, 0.996408, -0.0498954, -0.0653921, -0.0649359, 0.0543544, 0.996408, -0.01231, 0, 0, 0, 1),
            Qt.matrix4x4(0.98814, -0.103632, 0.113316, 0.0177694, 0.113316, 0.990117, -0.0826339, -0.11318, -0.103633, 0.0944943, 0.990117, -0.0171638, 0, 0, 0, 1),
            Qt.matrix4x4(0.999972, -0.00524639, 0.00526774, -0.00994277, 0.00526774, 0.999978, -0.00404667, -0.0140059, -0.00524639, 0.00407431, 0.999978, -0.0108793, 0, 0, 0, 1),
            Qt.matrix4x4(0.999753, -0.0156078, 0.0158004, -0.00942554, 0.0158004, 0.999801, -0.0121378, -0.0605852, -0.0156078, 0.0123845, 0.999802, -0.011275, 0, 0, 0, 1),
            Qt.matrix4x4(0.999321, -0.0257887, 0.0263247, -0.00843661, 0.0263247, 0.999449, -0.0202226, -0.107158, -0.0257887, 0.0209019, 0.999449, -0.0120725, 0, 0, 0, 1),
            Qt.matrix4x4(0.998759, 0.0359775, -0.0344496, -0.0169976, -0.0344496, 0.998439, 0.0439614, -0.0155841, 0.0359775, -0.04272, 0.998439, -0.0196907, 0, 0, 0, 1),
            Qt.matrix4x4(0.988018, 0.115755, -0.102083, -0.0197404, -0.102083, 0.986209, 0.130269, -0.0551627, 0.115755, -0.118287, 0.986209, -0.0165517, 0, 0, 0, 1),
            Qt.matrix4x4(0.96497, 0.20305, -0.166141, -0.0259773, -0.166141, 0.963041, 0.212014, -0.0943641, 0.20305, -0.176984, 0.963041, -0.0114304, 0, 0, 0, 1),
            Qt.matrix4x4(0.999978, 0.00474478, -0.0046569, -0.0272883, -0.0046569, 0.999814, 0.0187052, -0.0189449, 0.00474478, -0.0186831, 0.999814, -0.0203591, 0, 0, 0, 1),
            Qt.matrix4x4(0.999794, 0.0147534, -0.01395, -0.0276099, -0.01395, 0.998331, 0.0560324, -0.0530468, 0.0147534, -0.0558262, 0.998331, -0.0186558, 0, 0, 0, 1),
            Qt.matrix4x4(0.999407, 0.0254435, -0.0231813, -0.0283052, -0.0231814, 0.995386, 0.0931118, -0.0870939, 0.0254435, -0.0925192, 0.995386, -0.0157188, 0, 0, 0, 1),
            Qt.matrix4x4(0.999988, -0.00356476, 0.00344265, 0.0252539, 0.00344265, 0.999387, 0.0348452, -0.0198102, -0.00356476, -0.034833, 0.999387, 0.00598928, 0, 0, 0, 1),
            Qt.matrix4x4(0.999882, -0.0114082, 0.0102777, 0.0256678, 0.0102777, 0.994521, 0.104027, -0.0483305, -0.0114082, -0.103909, 0.994521, 0.00917775, 0, 0, 0, 1),
            Qt.matrix4x4(0.999652, -0.0201756, 0.0169656, 0.0263594, 0.0169656, 0.985, 0.171718, -0.0767051, -0.0201756, -0.171371, 0.985, 0.0142458, 0, 0, 0, 1),
            Qt.matrix4x4(0.998209, 0.0433078, -0.0412774, 0.0215512, -0.0412774, 0.997954, 0.0488327, -0.0142628, 0.0433078, -0.0470415, 0.997954, 0.00739637, 0, 0, 0, 1),
            Qt.matrix4x4(0.98265, 0.139822, -0.121856, 0.0158824, -0.121856, 0.982023, 0.14416, -0.0530078, 0.139822, -0.12681, 0.982023, 0.0137634, 0, 0, 0, 1),
            Qt.matrix4x4(0.949427, 0.244538, -0.196951, 0.00567803, -0.19695, 0.952324, 0.233, -0.0912749, 0.244538, -0.182427, 0.952324, 0.0217952, 0, 0, 0, 1),
            Qt.matrix4x4(0.999653, -0.0185349, 0.0187156, 0.00467736, 0.0187156, 0.999779, -0.00952814, -0.0143442, -0.0185349, 0.00987511, 0.999779, 0.00465235, 0, 0, 0, 1),
            Qt.matrix4x4(0.996946, -0.0543852, 0.056048, 0.00638802, 0.056048, 0.99802, -0.0285341, -0.0424953, -0.0543852, 0.0315883, 0.99802, 0.00358138, 0, 0, 0, 1),
            Qt.matrix4x4(0.991727, -0.0883885, 0.0930866, 0.00900815, 0.0930866, 0.994529, -0.0473905, -0.0705981, -0.0883885, 0.0556636, 0.99453, 0.00177848, 0, 0, 0, 1),
            Qt.matrix4x4(0.992603, -0.0851223, 0.0865694, -0.00678522, 0.0865694, 0.99616, -0.0130947, -0.0182271, -0.0851223, 0.0204921, 0.99616, -0.0042898, 0, 0, 0, 1),
            Qt.matrix4x4(0.938783, -0.234808, 0.252093, 0.000164472, 0.252093, 0.966951, -0.0381324, -0.0482521, -0.234808, 0.0993491, 0.966951, -0.00632258, 0, 0, 0, 1),
            Qt.matrix4x4(0.850738, -0.343513, 0.397798, 0.00969388, 0.397798, 0.915498, -0.0601721, -0.0775541, -0.343513, 0.209434, 0.915497, -0.0126548, 0, 0, 0, 1),
            Qt.matrix4x4(0.997003, 0.0547984, -0.0546115, -0.0141506, -0.0546115, 0.998496, 0.00490911, -0.0185772, 0.0547984, -0.00191198, 0.998496, -0.00652241, 0, 0, 0, 1),
            Qt.matrix4x4(0.973402, 0.162105, -0.161899, -0.0194659, -0.161899, 0.9867, 0.0145533, -0.0555267, 0.162105, 0.0120451, 0.9867, -0.0084776, 0, 0, 0, 1),
            Qt.matrix4x4(0.928769, 0.260472, -0.263709, -0.0280924, -0.263709, 0.964311, 0.0237052, -0.0921693, 0.260472, 0.0475259, 0.964311, -0.0122534, 0, 0, 0, 1),
            Qt.matrix4x4(0.999964, 0.0058584, -0.00610872, -0.0348221, -0.00610872, 0.999107, -0.0417988, -0.0168925, 0.0058584, 0.0418346, 0.999107, -0.00631823, 0, 0, 0, 1),
            Qt.matrix4x4(0.999706, 0.0160532, -0.0181966, -0.0354271, -0.0181966, 0.992051, -0.124511, -0.0627218, 0.0160532, 0.124805, 0.992051, -0.0119794, 0, 0, 0, 1),
            Qt.matrix4x4(0.999257, 0.0242915, -0.0299097, -0.0363573, -0.0299097, 0.978377, -0.204657, -0.108322, 0.0242915, 0.2054, 0.978377, -0.0212543, 0, 0, 0, 1),
            Qt.matrix4x4(0.999995, -0.00217429, 0.00207802, 0.0325421, 0.00207802, 0.998973, 0.0452563, -0.0185357, -0.00217429, -0.0452518, 0.998973, 0.0214164, 0, 0, 0, 1),
            Qt.matrix4x4(0.999956, -0.00708049, 0.00618342, 0.0329268, 0.00618342, 0.990871, 0.134668, -0.0597799, -0.00708049, -0.134624, 0.990872, 0.026743, 0, 0, 0, 1),
            Qt.matrix4x4(0.999868, -0.012697, 0.0101433, 0.033573, 0.0101433, 0.975242, 0.220906, -0.1008, -0.012697, -0.220774, 0.975242, 0.0355454, 0, 0, 0, 1),
            Qt.matrix4x4(0.998881, -0.0331749, 0.0337021, 0.0204261, 0.0337021, 0.999316, -0.0151968, -0.0189415, -0.033175, 0.0163156, 0.999316, 0.0189969, 0, 0, 0, 1),
            Qt.matrix4x4(0.990327, -0.0956093, 0.100558, 0.0251381, 0.100558, 0.993897, -0.045343, -0.0547413, -0.0956094, 0.0550163, 0.993897, 0.0156028, 0, 0, 0, 1),
            Qt.matrix4x4(0.974419, -0.151705, 0.165813, 0.0315552, 0.165813, 0.983319, -0.0747673, -0.0903697, -0.151705, 0.100349, 0.983319, 0.010374, 0, 0, 0, 1),
            Qt.matrix4x4(0.997504, 0.0501927, -0.0496643, 0.000439737, -0.0496643, 0.998696, 0.0118165, -0.0173208, 0.0501927, -0.0093205, 0.998696, 0.0114044, 0, 0, 0, 1),
            Qt.matrix4x4(0.977464, 0.15106, -0.147464, -0.00616314, -0.147464, 0.988445, 0.0350857, -0.0538674, 0.15106, -0.0125495, 0.988445, 0.011844, 0, 0, 0, 1),
            Qt.matrix4x4(0.938438, 0.24759, -0.240902, -0.0162127, -0.240902, 0.968856, 0.0573173, -0.0901059, 0.24759, 0.004245, 0.968855, 0.0110167, 0, 0, 0, 1),
            Qt.matrix4x4(0.998491, 0.0391225, -0.0385356, -0.00203259, -0.0385356, 0.999131, 0.0158583, -0.0162553, 0.0391225, -0.0143494, 0.999131, 0.00899371, 0, 0, 0, 1),
            Qt.matrix4x4(0.986165, 0.119573, -0.114812, -0.00759416, -0.114812, 0.992263, 0.0472479, -0.0605731, 0.119573, -0.0334124, 0.992263, 0.0101624, 0, 0, 0, 1),
            Qt.matrix4x4(0.961359, 0.200375, -0.188784, -0.0167661, -0.188784, 0.978941, 0.0776892, -0.104663, 0.200375, -0.0390477, 0.978941, 0.0111567, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: foliage_Root
        objectName: "Foliage_Root"
        source: "meshes/foliage_SkinnedSurface_mesh.mesh"
        skin: skin
        materials: [
            caulerpa_low_material
        ]
        Node {
            id: caulerpa_Attachment0
            objectName: "caulerpa_Attachment0"
            position: Qt.vector3d(-0.03, 0.0012, 0.016)
        }
        Node {
            id: caulerpa_Attachment1
            objectName: "caulerpa_Attachment1"
            position: Qt.vector3d(-0.0159714, 0.0012, 0.010741)
        }
        Node {
            id: caulerpa_Attachment10
            objectName: "caulerpa_Attachment10"
            position: Qt.vector3d(0.0152707, 0.0012, 0.00666121)
        }
        Node {
            id: caulerpa_Attachment11
            objectName: "caulerpa_Attachment11"
            position: Qt.vector3d(0.0328528, 0.0012, 0.00601254)
        }
        Node {
            id: caulerpa_Attachment12
            objectName: "caulerpa_Attachment12"
            position: Qt.vector3d(-0.0314741, 0.0012, -0.0223651)
        }
        Node {
            id: caulerpa_Attachment13
            objectName: "caulerpa_Attachment13"
            position: Qt.vector3d(-0.0186808, 0.0012, -0.0180123)
        }
        Node {
            id: caulerpa_Attachment14
            objectName: "caulerpa_Attachment14"
            position: Qt.vector3d(-0.00352277, 0.0012, -0.0122911)
        }
        Node {
            id: caulerpa_Attachment15
            objectName: "caulerpa_Attachment15"
            position: Qt.vector3d(0.00303076, 0.0012, -0.00909209)
        }
        Node {
            id: caulerpa_Attachment2
            objectName: "caulerpa_Attachment2"
            position: Qt.vector3d(-0.00898901, 0.0012, 0.00905835)
        }
        Node {
            id: caulerpa_Attachment3
            objectName: "caulerpa_Attachment3"
            position: Qt.vector3d(0.00837552, 0.0012, 0.0120962)
        }
        Node {
            id: caulerpa_Attachment4
            objectName: "caulerpa_Attachment4"
            position: Qt.vector3d(0.0174888, 0.0012, 0.0177888)
        }
        Node {
            id: caulerpa_Attachment5
            objectName: "caulerpa_Attachment5"
            position: Qt.vector3d(0.0283776, 0.0012, 0.0222649)
        }
        Node {
            id: caulerpa_Attachment6
            objectName: "caulerpa_Attachment6"
            position: Qt.vector3d(-0.0270984, 0.0012, -0.0058903)
        }
        Node {
            id: caulerpa_Attachment7
            objectName: "caulerpa_Attachment7"
            position: Qt.vector3d(-0.020653, 0.0012, -0.00672893)
        }
        Node {
            id: caulerpa_Attachment8
            objectName: "caulerpa_Attachment8"
            position: Qt.vector3d(-0.00499263, 0.0012, -0.00299166)
        }
        Node {
            id: caulerpa_Attachment9
            objectName: "caulerpa_Attachment9"
            position: Qt.vector3d(0.00716867, 0.0012, 0.00278004)
        }
        Node {
            id: caulerpa_GroundContact
            objectName: "caulerpa_GroundContact"
        }
        Node {
            id: foliageRig
            objectName: "FoliageRig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: caulerpa_Blade00_0
                    objectName: "caulerpa_Blade00_0"
                    position: Qt.vector3d(-0.03, 0.0164214, 0.014)
                    rotation: Qt.quaternion(0.999773, 0.0167594, -0.00929549, -0.00929549)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade00_1
                        objectName: "caulerpa_Blade00_1"
                        position: Qt.vector3d(-7.85803e-10, 0.0315796, 2.91038e-10)
                        rotation: Qt.quaternion(0.999084, 0.0327716, -0.0194732, -0.0194304)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade00_2
                            objectName: "caulerpa_Blade00_2"
                            position: Qt.vector3d(-1.97906e-09, 0.0317645, -2.09548e-09)
                            rotation: Qt.quaternion(0.999086, 0.0314167, -0.0205954, -0.0203722)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade01_0
                    objectName: "caulerpa_Blade01_0"
                    position: Qt.vector3d(-0.014619, 0.0190151, 0.0122145)
                    rotation: Qt.quaternion(0.999415, -0.0221416, -0.0184246, -0.0184246)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade01_1
                        objectName: "caulerpa_Blade01_1"
                        position: Qt.vector3d(7.27596e-10, 0.026326, -5.82077e-11)
                        rotation: Qt.quaternion(0.997799, -0.0455403, -0.0341717, -0.034003)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade01_2
                            objectName: "caulerpa_Blade01_2"
                            position: Qt.vector3d(5.82077e-11, 0.026673, 1.28057e-09)
                            rotation: Qt.quaternion(0.998036, -0.0458521, -0.0305464, -0.0298138)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade02_0
                    objectName: "caulerpa_Blade02_0"
                    position: Qt.vector3d(-0.0109817, 0.0178939, 0.00888733)
                    rotation: Qt.quaternion(0.999835, -0.00847265, -0.0113459, -0.0113459)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade02_1
                        objectName: "caulerpa_Blade02_1"
                        position: Qt.vector3d(4.07454e-10, 0.0488351, -1.44064e-09)
                        rotation: Qt.quaternion(0.999358, -0.0176359, -0.0220664, -0.0220399)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade02_2
                            objectName: "caulerpa_Blade02_2"
                            position: Qt.vector3d(0, 0.0489915, 7.85803e-10)
                            rotation: Qt.quaternion(0.999385, -0.0183963, -0.0211809, -0.0210546)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade03_0
                    objectName: "caulerpa_Blade03_0"
                    position: Qt.vector3d(0.0099592, 0.0139978, 0.0108748)
                    rotation: Qt.quaternion(0.999991, -0.00203026, -0.00262855, -0.00262855)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade03_1
                        objectName: "caulerpa_Blade03_1"
                        position: Qt.vector3d(-1.70985e-10, 0.046569, 4.91127e-10)
                        rotation: Qt.quaternion(0.999964, -0.00410092, -0.00522446, -0.00522411)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade03_2
                            objectName: "caulerpa_Blade03_2"
                            position: Qt.vector3d(1.1496e-09, 0.0465772, -1.74623e-10)
                            rotation: Qt.quaternion(0.999965, -0.00415287, -0.00518011, -0.0051784)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade04_0
                    objectName: "caulerpa_Blade04_0"
                    position: Qt.vector3d(0.0171481, 0.0153301, 0.0197595)
                    rotation: Qt.quaternion(0.999454, 0.0216822, 0.0176164, 0.0176164)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade04_1
                        objectName: "caulerpa_Blade04_1"
                        position: Qt.vector3d(-1.86265e-09, 0.0394607, 4.07454e-10)
                        rotation: Qt.quaternion(0.997782, 0.0408398, 0.0372584, 0.0370853)
                        Node {
                            id: caulerpa_Blade04_2
                            objectName: "caulerpa_Blade04_2"
                            position: Qt.vector3d(9.31323e-10, 0.03995, -1.16415e-09)
                            rotation: Qt.quaternion(0.997799, 0.0365206, 0.0395845, 0.0386896)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade05_0
                    objectName: "caulerpa_Blade05_0"
                    position: Qt.vector3d(0.0272961, 0.0186905, 0.0205826)
                    rotation: Qt.quaternion(0.999951, 0.00934754, 0.00235054, 0.00235054)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade05_1
                        objectName: "caulerpa_Blade05_1"
                        position: Qt.vector3d(-9.31323e-10, 0.0336399, 8.44011e-10)
                        rotation: Qt.quaternion(0.999803, 0.0186323, 0.00483051, 0.00482782)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade05_2
                            objectName: "caulerpa_Blade05_2"
                            position: Qt.vector3d(0, 0.0336899, -2.12458e-09)
                            rotation: Qt.quaternion(0.999804, 0.0185016, 0.00500251, 0.00498863)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade06_0
                    objectName: "caulerpa_Blade06_0"
                    position: Qt.vector3d(-0.025164, 0.0200967, -0.00538226)
                    rotation: Qt.quaternion(0.999845, 0.0174222, -0.00175212, -0.00175212)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade06_1
                        objectName: "caulerpa_Blade06_1"
                        position: Qt.vector3d(9.26775e-10, 0.0292334, -4.58385e-10)
                        rotation: Qt.quaternion(0.999386, 0.0346498, -0.00368185, -0.00367509)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade06_2
                            objectName: "caulerpa_Blade06_2"
                            position: Qt.vector3d(-5.91172e-10, 0.0293764, 5.82077e-11)
                            rotation: Qt.quaternion(0.999402, 0.0341219, -0.00391722, -0.00388168)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade07_0
                    objectName: "caulerpa_Blade07_0"
                    position: Qt.vector3d(-0.0224216, 0.0136482, -0.00579517)
                    rotation: Qt.quaternion(0.999264, 0.0239862, 0.0211619, 0.0211619)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade07_1
                        objectName: "caulerpa_Blade07_1"
                        position: Qt.vector3d(5.82077e-11, 0.0380091, 1.16415e-10)
                        rotation: Qt.quaternion(0.997007, 0.0443222, 0.0449273, 0.0446542)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade07_2
                            objectName: "caulerpa_Blade07_2"
                            position: Qt.vector3d(9.8953e-10, 0.0386257, -1.39698e-09)
                            rotation: Qt.quaternion(0.997054, 0.0381544, 0.0477435, 0.0463433)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade08_0
                    objectName: "caulerpa_Blade08_0"
                    position: Qt.vector3d(-0.00432105, 0.0143818, -0.00487553)
                    rotation: Qt.quaternion(0.999901, -0.00485129, -0.00931353, -0.00931353)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade08_1
                        objectName: "caulerpa_Blade08_1"
                        position: Qt.vector3d(-7.27596e-11, 0.0282699, 1.81899e-10)
                        rotation: Qt.quaternion(0.999612, -0.0101953, -0.0183305, -0.0183184)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade08_2
                            objectName: "caulerpa_Blade08_2"
                            position: Qt.vector3d(2.61934e-10, 0.0283197, -1.60071e-10)
                            rotation: Qt.quaternion(0.999622, -0.0107953, -0.0179016, -0.0178427)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade09_0
                    objectName: "caulerpa_Blade09_0"
                    position: Qt.vector3d(0.00794778, 0.0176675, 0.00462204)
                    rotation: Qt.quaternion(0.998114, -0.00841259, -0.0430041, -0.0430041)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade09_1
                        objectName: "caulerpa_Blade09_1"
                        position: Qt.vector3d(-5.23869e-10, 0.0297711, 3.49246e-10)
                        rotation: Qt.quaternion(0.993035, -0.0265872, -0.081624, -0.0807011)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade09_2
                            objectName: "caulerpa_Blade09_2"
                            position: Qt.vector3d(-6.25732e-10, 0.0306704, 2.32831e-10)
                            rotation: Qt.quaternion(0.994249, -0.035615, -0.0733302, -0.0694431)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade10_0
                    objectName: "caulerpa_Blade10_0"
                    position: Qt.vector3d(0.0134511, 0.0193122, 0.00583101)
                    rotation: Qt.quaternion(0.999249, 0.00170655, 0.027373, 0.027373)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade10_1
                        objectName: "caulerpa_Blade10_1"
                        position: Qt.vector3d(-7.27596e-10, 0.038792, 2.61934e-10)
                        rotation: Qt.quaternion(0.997047, -0.00106437, 0.0544154, 0.0541716)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade10_2
                            objectName: "caulerpa_Blade10_2"
                            position: Qt.vector3d(2.21189e-09, 0.0392557, -4.07454e-10)
                            rotation: Qt.quaternion(0.99722, -0.00664373, 0.0530559, 0.0518984)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade11_0
                    objectName: "caulerpa_Blade11_0"
                    position: Qt.vector3d(0.0347547, 0.0173458, 0.00539379)
                    rotation: Qt.quaternion(0.999772, -0.0209131, 0.00299246, 0.00299246)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade11_1
                        objectName: "caulerpa_Blade11_1"
                        position: Qt.vector3d(-1.77715e-09, 0.0469832, 2.91038e-11)
                        rotation: Qt.quaternion(0.999104, -0.0415705, 0.00559893, 0.005584)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade11_2
                            objectName: "caulerpa_Blade11_2"
                            position: Qt.vector3d(-2.75395e-09, 0.0473174, -8.14907e-10)
                            rotation: Qt.quaternion(0.999143, -0.0407628, 0.00509877, 0.00503187)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade12_0
                    objectName: "caulerpa_Blade12_0"
                    position: Qt.vector3d(-0.0324569, 0.0195566, -0.0206232)
                    rotation: Qt.quaternion(0.999743, 0.0226329, -0.00106335, -0.00106335)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade12_1
                        objectName: "caulerpa_Blade12_1"
                        position: Qt.vector3d(-4.18368e-09, 0.0435557, -6.76664e-10)
                        rotation: Qt.quaternion(0.998987, 0.0448791, -0.00226529, -0.00225835)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade12_2
                            objectName: "caulerpa_Blade12_2"
                            position: Qt.vector3d(2.18279e-11, 0.0439118, 1.74623e-09)
                            rotation: Qt.quaternion(0.999034, 0.0438, -0.00244821, -0.00241136)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade13_0
                    objectName: "caulerpa_Blade13_0"
                    position: Qt.vector3d(-0.0191347, 0.0192962, -0.0199602)
                    rotation: Qt.quaternion(0.999689, -0.00788053, -0.0167245, -0.0167245)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade13_1
                        objectName: "caulerpa_Blade13_1"
                        position: Qt.vector3d(4.65661e-10, 0.0366811, -1.16415e-09)
                        rotation: Qt.quaternion(0.998795, -0.017292, -0.0325158, -0.0324494)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade13_2
                            objectName: "caulerpa_Blade13_2"
                            position: Qt.vector3d(-2.32831e-09, 0.0368811, 1.28057e-09)
                            rotation: Qt.quaternion(0.998861, -0.0190117, -0.031096, -0.030782)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade14_0
                    objectName: "caulerpa_Blade14_0"
                    position: Qt.vector3d(-0.00187128, 0.0173824, -0.0111631)
                    rotation: Qt.quaternion(0.999362, 0.00528763, 0.0249802, 0.0249802)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: caulerpa_Blade14_1
                        objectName: "caulerpa_Blade14_1"
                        position: Qt.vector3d(-5.82077e-11, 0.0369905, 4.65661e-10)
                        rotation: Qt.quaternion(0.997457, 0.00671233, 0.0502729, 0.0500775)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade14_2
                            objectName: "caulerpa_Blade14_2"
                            position: Qt.vector3d(6.98492e-10, 0.0373741, -2.32831e-10)
                            rotation: Qt.quaternion(0.997549, 0.00161079, 0.0499339, 0.0489855)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: caulerpa_Blade15_0
                    objectName: "caulerpa_Blade15_0"
                    position: Qt.vector3d(0.00105126, 0.0164498, -0.00880644)
                    rotation: Qt.quaternion(0.999594, 0.00755499, 0.0194224, 0.0194224)
                    Node {
                        id: caulerpa_Blade15_1
                        objectName: "caulerpa_Blade15_1"
                        position: Qt.vector3d(2.03727e-10, 0.0449413, -6.73026e-10)
                        rotation: Qt.quaternion(0.998363, 0.0127039, 0.0394884, 0.039386)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: caulerpa_Blade15_2
                            objectName: "caulerpa_Blade15_2"
                            position: Qt.vector3d(0, 0.0452524, -4.65661e-10)
                            rotation: Qt.quaternion(0.998378, 0.00934116, 0.0399663, 0.0394557)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
            }
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
            target: caulerpa_Blade15_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade15_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade15_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade15_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade15_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade15_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade15_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade15_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade15_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade15_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade14_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade14_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade14_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade14_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade14_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade14_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade14_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade14_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade14_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade14_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade13_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade13_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade13_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade13_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade13_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade13_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade13_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade13_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade13_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade13_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade12_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade12_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade12_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade12_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade12_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade12_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade12_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade12_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade12_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade12_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade11_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade11_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade11_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade11_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade11_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade11_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade11_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade11_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade11_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade11_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade10_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade10_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade10_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade10_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade10_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade10_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade10_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade10_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade10_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade10_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade09_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade09_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade09_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade09_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade09_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade09_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade09_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade09_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade03_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade03_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade03_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade03_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade03_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade03_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade02_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade02_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade02_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade02_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade02_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade02_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade02_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade02_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade02_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade02_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade01_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade01_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade01_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade01_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade01_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade01_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade01_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade01_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade01_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade01_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade00_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade00_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade00_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade00_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade09_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade09_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade00_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade00_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade00_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade00_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade00_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade00_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade03_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade03_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade03_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade03_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade06_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade06_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade06_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade06_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade04_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade04_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade04_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade04_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade04_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade04_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade04_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade04_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade04_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade04_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade05_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade05_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade05_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade05_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade05_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade05_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade05_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade05_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade05_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade05_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade06_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade06_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade06_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade06_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade06_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade06_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade07_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade07_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade07_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade07_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade07_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade07_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade07_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade07_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade07_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade07_2_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade08_0
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade08_0_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade08_1
            property: "position"
            keyframeSource: "animations/caulerpa_Blade08_1_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade08_1
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade08_1_rotation_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade08_2
            property: "position"
            keyframeSource: "animations/caulerpa_Blade08_2_position_0.qad"
        }
        KeyframeGroup {
            target: caulerpa_Blade08_2
            property: "rotation"
            keyframeSource: "animations/caulerpa_Blade08_2_rotation_0.qad"
        }
    }
}
