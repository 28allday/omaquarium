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
        id: clam_shell_low_material
        objectName: "Clam_shell_low"
        baseColorMap: _6_texture
        metalnessMap: _7_texture
        roughnessMap: _7_texture
        roughness: 1
        normalMap: _8_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: clam_mantle_low_material
        objectName: "Clam_mantle_low"
        baseColorMap: _3_texture
        metalnessMap: _4_texture
        roughnessMap: _4_texture
        roughness: 1
        normalMap: _5_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: clam_cavity_low_material
        objectName: "Clam_cavity_low"
        baseColorMap: _0_texture
        metalnessMap: _1_texture
        roughnessMap: _1_texture
        roughness: 1
        normalMap: _2_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            root,
            body,
            valve_Front,
            valve_Back,
            mantle_00_0,
            mantle_00_1,
            mantle_00_2,
            mantle_00_3,
            mantle_00_4,
            mantle_01_0,
            mantle_01_1,
            mantle_01_2,
            mantle_01_3,
            mantle_01_4,
            mantle_02_0,
            mantle_02_1,
            mantle_02_2,
            mantle_02_3,
            mantle_02_4,
            mantle_03_0,
            mantle_03_1,
            mantle_03_2,
            mantle_03_3,
            mantle_03_4,
            mantle_04_0,
            mantle_04_1,
            mantle_04_2,
            mantle_04_3,
            mantle_04_4,
            mantle_05_0,
            mantle_05_1,
            mantle_05_2,
            mantle_05_3,
            mantle_05_4,
            mantle_06_0,
            mantle_06_1,
            mantle_06_2,
            mantle_06_3,
            mantle_06_4,
            mantle_07_0,
            mantle_07_1,
            mantle_07_2,
            mantle_07_3,
            mantle_07_4,
            mantle_08_0,
            mantle_08_1,
            mantle_08_2,
            mantle_08_3,
            mantle_08_4,
            mantle_09_0,
            mantle_09_1,
            mantle_09_2,
            mantle_09_3,
            mantle_09_4,
            mantle_10_0,
            mantle_10_1,
            mantle_10_2,
            mantle_10_3,
            mantle_10_4,
            mantle_11_0,
            mantle_11_1,
            mantle_11_2,
            mantle_11_3,
            mantle_11_4,
            mantle_12_0,
            mantle_12_1,
            mantle_12_2,
            mantle_12_3,
            mantle_12_4,
            mantle_13_0,
            mantle_13_1,
            mantle_13_2,
            mantle_13_3,
            mantle_13_4,
            mantle_14_0,
            mantle_14_1,
            mantle_14_2,
            mantle_14_3,
            mantle_14_4,
            mantle_15_0,
            mantle_15_1,
            mantle_15_2,
            mantle_15_3,
            mantle_15_4,
            mantle_16_0,
            mantle_16_1,
            mantle_16_2,
            mantle_16_3,
            mantle_16_4,
            mantle_17_0,
            mantle_17_1,
            mantle_17_2,
            mantle_17_3,
            mantle_17_4,
            mantle_18_0,
            mantle_18_1,
            mantle_18_2,
            mantle_18_3,
            mantle_18_4,
            mantle_19_0,
            mantle_19_1,
            mantle_19_2,
            mantle_19_3,
            mantle_19_4,
            mantle_20_0,
            mantle_20_1,
            mantle_20_2,
            mantle_20_3,
            mantle_20_4
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.004, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0, 4.37114e-08, 1, -3.27835e-11, 1, -5.2108e-15, -1.19209e-07, 0.022, 0, 1, -4.37114e-08, -0.000749999, 0, 0, 0, 1),
            Qt.matrix4x4(0, 4.37114e-08, 1, -3.27835e-11, 1, -5.2108e-15, -1.19209e-07, 0.022, 0, 1, -4.37114e-08, -0.000749999, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0915, 0, 1, 0, -0.00994039, 0, 0, 1, -0.00665, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0915, 0, 1, 0, -0.00842333, 0, 0, 1, -0.003325, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0915, 0, 1, 0, -0.00775, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0915, 0, 1, 0, -0.00831074, 0, 0, 1, 0.003325, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0915, 0, 1, 0, -0.00994039, 0, 0, 1, 0.00665, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0815811, 0, 1, 0, -0.0324801, 0, 0, 1, -0.0196633, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0815811, 0, 1, 0, -0.0289569, 0, 0, 1, -0.00983166, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0815811, 0, 1, 0, -0.02727, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0815811, 0, 1, 0, -0.0285813, 0, 0, 1, 0.00983166, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0815811, 0, 1, 0, -0.0324801, 0, 0, 1, 0.0196633, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0722013, 0, 1, 0, -0.0420902, 0, 0, 1, -0.0252117, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0722013, 0, 1, 0, -0.0373522, 0, 0, 1, -0.0126059, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0722013, 0, 1, 0, -0.0355926, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0722013, 0, 1, 0, -0.0375616, 0, 0, 1, 0.0126059, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0722013, 0, 1, 0, -0.0420902, 0, 0, 1, 0.0252117, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0630605, 0, 1, 0, -0.0365714, 0, 0, 1, -0.0220254, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0630605, 0, 1, 0, -0.0321935, 0, 0, 1, -0.0110127, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0630605, 0, 1, 0, -0.0308132, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0630605, 0, 1, 0, -0.0325151, 0, 0, 1, 0.0110127, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0630605, 0, 1, 0, -0.0365714, 0, 0, 1, 0.0220254, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0540151, 0, 1, 0, -0.0493945, 0, 0, 1, -0.0294288, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0540151, 0, 1, 0, -0.0440273, 0, 0, 1, -0.0147144, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0540151, 0, 1, 0, -0.0419182, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0540151, 0, 1, 0, -0.0437351, 0, 0, 1, 0.0147144, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0540151, 0, 1, 0, -0.0493945, 0, 0, 1, 0.0294288, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0450029, 0, 1, 0, -0.060017, 0, 0, 1, -0.0355617, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0450029, 0, 1, 0, -0.0489241, 0, 0, 1, -0.0177809, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0450029, 0, 1, 0, -0.04475, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0450029, 0, 1, 0, -0.0486778, 0, 0, 1, 0.0177809, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0450029, 0, 1, 0, -0.060017, 0, 0, 1, 0.0355617, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0360004, 0, 1, 0, -0.0615593, 0, 0, 1, -0.0364522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0360004, 0, 1, 0, -0.0489802, 0, 0, 1, -0.0182261, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0360004, 0, 1, 0, -0.04475, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0360004, 0, 1, 0, -0.0493359, 0, 0, 1, 0.0182261, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0360004, 0, 1, 0, -0.0615593, 0, 0, 1, 0.0364522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.027, 0, 1, 0, -0.050824, 0, 0, 1, -0.0302541, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.027, 0, 1, 0, -0.0450691, 0, 0, 1, -0.0151271, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.027, 0, 1, 0, -0.0431562, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.027, 0, 1, 0, -0.0452233, 0, 0, 1, 0.0151271, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.027, 0, 1, 0, -0.050824, 0, 0, 1, 0.0302541, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.018, 0, 1, 0, -0.0459015, 0, 0, 1, -0.0274122, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.018, 0, 1, 0, -0.0409786, 0, 0, 1, -0.0137061, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.018, 0, 1, 0, -0.0388933, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.018, 0, 1, 0, -0.040583, 0, 0, 1, 0.0137061, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.018, 0, 1, 0, -0.0459015, 0, 0, 1, 0.0274122, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.009, 0, 1, 0, -0.0520589, 0, 0, 1, -0.0309672, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.009, 0, 1, 0, -0.0464627, 0, 0, 1, -0.0154836, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.009, 0, 1, 0, -0.0442257, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.009, 0, 1, 0, -0.04641, 0, 0, 1, 0.0154836, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.009, 0, 1, 0, -0.0520589, 0, 0, 1, 0.0309672, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0652945, 0, 0, 1, -0.0386087, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.049841, 0, 0, 1, -0.0193044, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0448508, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0502502, 0, 0, 1, 0.0193044, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.0652945, 0, 0, 1, 0.0386087, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.009, 0, 1, 0, -0.0664926, 0, 0, 1, -0.0393004, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.009, 0, 1, 0, -0.0502786, 0, 0, 1, -0.0196502, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.009, 0, 1, 0, -0.0488862, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.009, 0, 1, 0, -0.0502259, 0, 0, 1, 0.0196502, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.009, 0, 1, 0, -0.0664926, 0, 0, 1, 0.0393004, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.018, 0, 1, 0, -0.0490705, 0, 0, 1, -0.0292418, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.018, 0, 1, 0, -0.0438771, 0, 0, 1, -0.0146209, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.018, 0, 1, 0, -0.0416377, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.018, 0, 1, 0, -0.0434815, 0, 0, 1, 0.0146209, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.018, 0, 1, 0, -0.0490705, 0, 0, 1, 0.0292418, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.027, 0, 1, 0, -0.0386726, 0, 0, 1, -0.0232386, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.027, 0, 1, 0, -0.0343116, 0, 0, 1, -0.0116193, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.027, 0, 1, 0, -0.0326329, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.027, 0, 1, 0, -0.0344663, 0, 0, 1, 0.0116193, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.027, 0, 1, 0, -0.0386726, 0, 0, 1, 0.0232386, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0360004, 0, 1, 0, -0.0576574, 0, 0, 1, -0.0341995, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0360004, 0, 1, 0, -0.0479122, 0, 0, 1, -0.0170997, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0360004, 0, 1, 0, -0.04475, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0360004, 0, 1, 0, -0.0482679, 0, 0, 1, 0.0170997, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0360004, 0, 1, 0, -0.0576574, 0, 0, 1, 0.0341995, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0450029, 0, 1, 0, -0.0631999, 0, 0, 1, -0.0373994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0450029, 0, 1, 0, -0.0495703, 0, 0, 1, -0.0186997, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0450029, 0, 1, 0, -0.04475, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0450029, 0, 1, 0, -0.049324, 0, 0, 1, 0.0186997, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0450029, 0, 1, 0, -0.0631999, 0, 0, 1, 0.0373994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0540151, 0, 1, 0, -0.0598574, 0, 0, 1, -0.0354696, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0540151, 0, 1, 0, -0.048898, 0, 0, 1, -0.0177348, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0540151, 0, 1, 0, -0.04475, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0540151, 0, 1, 0, -0.0486057, 0, 0, 1, 0.0177348, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0540151, 0, 1, 0, -0.0598574, 0, 0, 1, 0.0354696, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0630605, 0, 1, 0, -0.0400831, 0, 0, 1, -0.0240529, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0630605, 0, 1, 0, -0.0354681, 0, 0, 1, -0.0120265, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0630605, 0, 1, 0, -0.0338544, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0630605, 0, 1, 0, -0.0357897, 0, 0, 1, 0.0120265, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0630605, 0, 1, 0, -0.0400831, 0, 0, 1, 0.0240529, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0722013, 0, 1, 0, -0.0312616, 0, 0, 1, -0.0189598, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0722013, 0, 1, 0, -0.0274508, 0, 0, 1, -0.00947991, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0722013, 0, 1, 0, -0.0262147, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0722013, 0, 1, 0, -0.0276602, 0, 0, 1, 0.00947991, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0722013, 0, 1, 0, -0.0312616, 0, 0, 1, 0.0189598, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0815811, 0, 1, 0, -0.0330294, 0, 0, 1, -0.0199805, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0815811, 0, 1, 0, -0.0293767, 0, 0, 1, -0.00999023, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0815811, 0, 1, 0, -0.0277457, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0815811, 0, 1, 0, -0.0290011, 0, 0, 1, 0.00999023, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0815811, 0, 1, 0, -0.0330294, 0, 0, 1, 0.0199805, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0915, 0, 1, 0, -0.00994039, 0, 0, 1, -0.00665, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0915, 0, 1, 0, -0.00860336, 0, 0, 1, -0.003325, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0915, 0, 1, 0, -0.00775, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0915, 0, 1, 0, -0.00849077, 0, 0, 1, 0.003325, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0915, 0, 1, 0, -0.00994039, 0, 0, 1, 0.00665, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: clam_Root
        objectName: "Clam_Root"
        source: "meshes/clam_Root_mesh.mesh"
        skin: skin
        materials: [
            clam_cavity_low_material,
            clam_mantle_low_material,
            clam_shell_low_material
        ]
        Node {
            id: clam_Rig
            objectName: "Clam_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: body
                    objectName: "Body"
                    position: Qt.vector3d(0, 0.004, 0)
                    Node {
                        id: valve_Front
                        objectName: "Valve_Front"
                        position: Qt.vector3d(-0.022, -0.00325, 0)
                        rotation: Qt.quaternion(0.5, -0.5, -0.5, -0.5)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: valve_Back
                        objectName: "Valve_Back"
                        position: Qt.vector3d(-0.022, -0.00325, 0)
                        rotation: Qt.quaternion(0.5, -0.5, -0.5, -0.5)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mantle_00_0
                        objectName: "Mantle_00_0"
                        position: Qt.vector3d(-0.0915, 0.00594039, 0.00665)
                    }
                    Node {
                        id: mantle_00_1
                        objectName: "Mantle_00_1"
                        position: Qt.vector3d(-0.0915, 0.00442333, 0.003325)
                    }
                    Node {
                        id: mantle_00_2
                        objectName: "Mantle_00_2"
                        position: Qt.vector3d(-0.0915, 0.00375, 0)
                    }
                    Node {
                        id: mantle_00_3
                        objectName: "Mantle_00_3"
                        position: Qt.vector3d(-0.0915, 0.00431074, -0.003325)
                    }
                    Node {
                        id: mantle_00_4
                        objectName: "Mantle_00_4"
                        position: Qt.vector3d(-0.0915, 0.00594039, -0.00665)
                    }
                    Node {
                        id: mantle_01_0
                        objectName: "Mantle_01_0"
                        position: Qt.vector3d(-0.0815811, 0.0284801, 0.0196633)
                    }
                    Node {
                        id: mantle_01_1
                        objectName: "Mantle_01_1"
                        position: Qt.vector3d(-0.0815811, 0.0249569, 0.00983166)
                    }
                    Node {
                        id: mantle_01_2
                        objectName: "Mantle_01_2"
                        position: Qt.vector3d(-0.0815811, 0.02327, 0)
                    }
                    Node {
                        id: mantle_01_3
                        objectName: "Mantle_01_3"
                        position: Qt.vector3d(-0.0815811, 0.0245813, -0.00983166)
                    }
                    Node {
                        id: mantle_01_4
                        objectName: "Mantle_01_4"
                        position: Qt.vector3d(-0.0815811, 0.0284801, -0.0196633)
                    }
                    Node {
                        id: mantle_02_0
                        objectName: "Mantle_02_0"
                        position: Qt.vector3d(-0.0722013, 0.0380902, 0.0252117)
                    }
                    Node {
                        id: mantle_02_1
                        objectName: "Mantle_02_1"
                        position: Qt.vector3d(-0.0722013, 0.0333522, 0.0126059)
                    }
                    Node {
                        id: mantle_02_2
                        objectName: "Mantle_02_2"
                        position: Qt.vector3d(-0.0722013, 0.0315926, 0)
                    }
                    Node {
                        id: mantle_02_3
                        objectName: "Mantle_02_3"
                        position: Qt.vector3d(-0.0722013, 0.0335616, -0.0126059)
                    }
                    Node {
                        id: mantle_02_4
                        objectName: "Mantle_02_4"
                        position: Qt.vector3d(-0.0722013, 0.0380902, -0.0252117)
                    }
                    Node {
                        id: mantle_03_0
                        objectName: "Mantle_03_0"
                        position: Qt.vector3d(-0.0630605, 0.0325714, 0.0220254)
                    }
                    Node {
                        id: mantle_03_1
                        objectName: "Mantle_03_1"
                        position: Qt.vector3d(-0.0630605, 0.0281935, 0.0110127)
                    }
                    Node {
                        id: mantle_03_2
                        objectName: "Mantle_03_2"
                        position: Qt.vector3d(-0.0630605, 0.0268132, 0)
                    }
                    Node {
                        id: mantle_03_3
                        objectName: "Mantle_03_3"
                        position: Qt.vector3d(-0.0630605, 0.0285151, -0.0110127)
                    }
                    Node {
                        id: mantle_03_4
                        objectName: "Mantle_03_4"
                        position: Qt.vector3d(-0.0630605, 0.0325714, -0.0220254)
                    }
                    Node {
                        id: mantle_04_0
                        objectName: "Mantle_04_0"
                        position: Qt.vector3d(-0.0540151, 0.0453945, 0.0294288)
                    }
                    Node {
                        id: mantle_04_1
                        objectName: "Mantle_04_1"
                        position: Qt.vector3d(-0.0540151, 0.0400273, 0.0147144)
                    }
                    Node {
                        id: mantle_04_2
                        objectName: "Mantle_04_2"
                        position: Qt.vector3d(-0.0540151, 0.0379182, 0)
                    }
                    Node {
                        id: mantle_04_3
                        objectName: "Mantle_04_3"
                        position: Qt.vector3d(-0.0540151, 0.0397351, -0.0147144)
                    }
                    Node {
                        id: mantle_04_4
                        objectName: "Mantle_04_4"
                        position: Qt.vector3d(-0.0540151, 0.0453945, -0.0294288)
                    }
                    Node {
                        id: mantle_05_0
                        objectName: "Mantle_05_0"
                        position: Qt.vector3d(-0.0450029, 0.056017, 0.0355617)
                    }
                    Node {
                        id: mantle_05_1
                        objectName: "Mantle_05_1"
                        position: Qt.vector3d(-0.0450029, 0.0449241, 0.0177809)
                    }
                    Node {
                        id: mantle_05_2
                        objectName: "Mantle_05_2"
                        position: Qt.vector3d(-0.0450029, 0.04075, 0)
                    }
                    Node {
                        id: mantle_05_3
                        objectName: "Mantle_05_3"
                        position: Qt.vector3d(-0.0450029, 0.0446778, -0.0177809)
                    }
                    Node {
                        id: mantle_05_4
                        objectName: "Mantle_05_4"
                        position: Qt.vector3d(-0.0450029, 0.056017, -0.0355617)
                    }
                    Node {
                        id: mantle_06_0
                        objectName: "Mantle_06_0"
                        position: Qt.vector3d(-0.0360004, 0.0575593, 0.0364522)
                    }
                    Node {
                        id: mantle_06_1
                        objectName: "Mantle_06_1"
                        position: Qt.vector3d(-0.0360004, 0.0449802, 0.0182261)
                    }
                    Node {
                        id: mantle_06_2
                        objectName: "Mantle_06_2"
                        position: Qt.vector3d(-0.0360004, 0.04075, 0)
                    }
                    Node {
                        id: mantle_06_3
                        objectName: "Mantle_06_3"
                        position: Qt.vector3d(-0.0360004, 0.0453359, -0.0182261)
                    }
                    Node {
                        id: mantle_06_4
                        objectName: "Mantle_06_4"
                        position: Qt.vector3d(-0.0360004, 0.0575593, -0.0364522)
                    }
                    Node {
                        id: mantle_07_0
                        objectName: "Mantle_07_0"
                        position: Qt.vector3d(-0.027, 0.046824, 0.0302541)
                    }
                    Node {
                        id: mantle_07_1
                        objectName: "Mantle_07_1"
                        position: Qt.vector3d(-0.027, 0.0410691, 0.0151271)
                    }
                    Node {
                        id: mantle_07_2
                        objectName: "Mantle_07_2"
                        position: Qt.vector3d(-0.027, 0.0391562, 0)
                    }
                    Node {
                        id: mantle_07_3
                        objectName: "Mantle_07_3"
                        position: Qt.vector3d(-0.027, 0.0412233, -0.0151271)
                    }
                    Node {
                        id: mantle_07_4
                        objectName: "Mantle_07_4"
                        position: Qt.vector3d(-0.027, 0.046824, -0.0302541)
                    }
                    Node {
                        id: mantle_08_0
                        objectName: "Mantle_08_0"
                        position: Qt.vector3d(-0.018, 0.0419015, 0.0274122)
                    }
                    Node {
                        id: mantle_08_1
                        objectName: "Mantle_08_1"
                        position: Qt.vector3d(-0.018, 0.0369786, 0.0137061)
                    }
                    Node {
                        id: mantle_08_2
                        objectName: "Mantle_08_2"
                        position: Qt.vector3d(-0.018, 0.0348933, 0)
                    }
                    Node {
                        id: mantle_08_3
                        objectName: "Mantle_08_3"
                        position: Qt.vector3d(-0.018, 0.036583, -0.0137061)
                    }
                    Node {
                        id: mantle_08_4
                        objectName: "Mantle_08_4"
                        position: Qt.vector3d(-0.018, 0.0419015, -0.0274122)
                    }
                    Node {
                        id: mantle_09_0
                        objectName: "Mantle_09_0"
                        position: Qt.vector3d(-0.009, 0.0480589, 0.0309672)
                    }
                    Node {
                        id: mantle_09_1
                        objectName: "Mantle_09_1"
                        position: Qt.vector3d(-0.009, 0.0424627, 0.0154836)
                    }
                    Node {
                        id: mantle_09_2
                        objectName: "Mantle_09_2"
                        position: Qt.vector3d(-0.009, 0.0402257, 0)
                    }
                    Node {
                        id: mantle_09_3
                        objectName: "Mantle_09_3"
                        position: Qt.vector3d(-0.009, 0.04241, -0.0154836)
                    }
                    Node {
                        id: mantle_09_4
                        objectName: "Mantle_09_4"
                        position: Qt.vector3d(-0.009, 0.0480589, -0.0309672)
                    }
                    Node {
                        id: mantle_10_0
                        objectName: "Mantle_10_0"
                        position: Qt.vector3d(0, 0.0612945, 0.0386087)
                    }
                    Node {
                        id: mantle_10_1
                        objectName: "Mantle_10_1"
                        position: Qt.vector3d(0, 0.045841, 0.0193044)
                    }
                    Node {
                        id: mantle_10_2
                        objectName: "Mantle_10_2"
                        position: Qt.vector3d(0, 0.0408508, 0)
                    }
                    Node {
                        id: mantle_10_3
                        objectName: "Mantle_10_3"
                        position: Qt.vector3d(0, 0.0462502, -0.0193044)
                    }
                    Node {
                        id: mantle_10_4
                        objectName: "Mantle_10_4"
                        position: Qt.vector3d(0, 0.0612945, -0.0386087)
                    }
                    Node {
                        id: mantle_11_0
                        objectName: "Mantle_11_0"
                        position: Qt.vector3d(0.009, 0.0624926, 0.0393004)
                    }
                    Node {
                        id: mantle_11_1
                        objectName: "Mantle_11_1"
                        position: Qt.vector3d(0.009, 0.0462786, 0.0196502)
                    }
                    Node {
                        id: mantle_11_2
                        objectName: "Mantle_11_2"
                        position: Qt.vector3d(0.009, 0.0448862, 0)
                    }
                    Node {
                        id: mantle_11_3
                        objectName: "Mantle_11_3"
                        position: Qt.vector3d(0.009, 0.0462259, -0.0196502)
                    }
                    Node {
                        id: mantle_11_4
                        objectName: "Mantle_11_4"
                        position: Qt.vector3d(0.009, 0.0624926, -0.0393004)
                    }
                    Node {
                        id: mantle_12_0
                        objectName: "Mantle_12_0"
                        position: Qt.vector3d(0.018, 0.0450705, 0.0292418)
                    }
                    Node {
                        id: mantle_12_1
                        objectName: "Mantle_12_1"
                        position: Qt.vector3d(0.018, 0.0398771, 0.0146209)
                    }
                    Node {
                        id: mantle_12_2
                        objectName: "Mantle_12_2"
                        position: Qt.vector3d(0.018, 0.0376377, 0)
                    }
                    Node {
                        id: mantle_12_3
                        objectName: "Mantle_12_3"
                        position: Qt.vector3d(0.018, 0.0394815, -0.0146209)
                    }
                    Node {
                        id: mantle_12_4
                        objectName: "Mantle_12_4"
                        position: Qt.vector3d(0.018, 0.0450705, -0.0292418)
                    }
                    Node {
                        id: mantle_13_0
                        objectName: "Mantle_13_0"
                        position: Qt.vector3d(0.027, 0.0346726, 0.0232386)
                    }
                    Node {
                        id: mantle_13_1
                        objectName: "Mantle_13_1"
                        position: Qt.vector3d(0.027, 0.0303116, 0.0116193)
                    }
                    Node {
                        id: mantle_13_2
                        objectName: "Mantle_13_2"
                        position: Qt.vector3d(0.027, 0.0286329, 0)
                    }
                    Node {
                        id: mantle_13_3
                        objectName: "Mantle_13_3"
                        position: Qt.vector3d(0.027, 0.0304663, -0.0116193)
                    }
                    Node {
                        id: mantle_13_4
                        objectName: "Mantle_13_4"
                        position: Qt.vector3d(0.027, 0.0346726, -0.0232386)
                    }
                    Node {
                        id: mantle_14_0
                        objectName: "Mantle_14_0"
                        position: Qt.vector3d(0.0360004, 0.0536574, 0.0341995)
                    }
                    Node {
                        id: mantle_14_1
                        objectName: "Mantle_14_1"
                        position: Qt.vector3d(0.0360004, 0.0439122, 0.0170997)
                    }
                    Node {
                        id: mantle_14_2
                        objectName: "Mantle_14_2"
                        position: Qt.vector3d(0.0360004, 0.04075, 0)
                    }
                    Node {
                        id: mantle_14_3
                        objectName: "Mantle_14_3"
                        position: Qt.vector3d(0.0360004, 0.0442679, -0.0170997)
                    }
                    Node {
                        id: mantle_14_4
                        objectName: "Mantle_14_4"
                        position: Qt.vector3d(0.0360004, 0.0536574, -0.0341995)
                    }
                    Node {
                        id: mantle_15_0
                        objectName: "Mantle_15_0"
                        position: Qt.vector3d(0.0450029, 0.0591999, 0.0373994)
                    }
                    Node {
                        id: mantle_15_1
                        objectName: "Mantle_15_1"
                        position: Qt.vector3d(0.0450029, 0.0455703, 0.0186997)
                    }
                    Node {
                        id: mantle_15_2
                        objectName: "Mantle_15_2"
                        position: Qt.vector3d(0.0450029, 0.04075, 0)
                    }
                    Node {
                        id: mantle_15_3
                        objectName: "Mantle_15_3"
                        position: Qt.vector3d(0.0450029, 0.045324, -0.0186997)
                    }
                    Node {
                        id: mantle_15_4
                        objectName: "Mantle_15_4"
                        position: Qt.vector3d(0.0450029, 0.0591999, -0.0373994)
                    }
                    Node {
                        id: mantle_16_0
                        objectName: "Mantle_16_0"
                        position: Qt.vector3d(0.0540151, 0.0558574, 0.0354696)
                    }
                    Node {
                        id: mantle_16_1
                        objectName: "Mantle_16_1"
                        position: Qt.vector3d(0.0540151, 0.044898, 0.0177348)
                    }
                    Node {
                        id: mantle_16_2
                        objectName: "Mantle_16_2"
                        position: Qt.vector3d(0.0540151, 0.04075, 0)
                    }
                    Node {
                        id: mantle_16_3
                        objectName: "Mantle_16_3"
                        position: Qt.vector3d(0.0540151, 0.0446057, -0.0177348)
                    }
                    Node {
                        id: mantle_16_4
                        objectName: "Mantle_16_4"
                        position: Qt.vector3d(0.0540151, 0.0558574, -0.0354696)
                    }
                    Node {
                        id: mantle_17_0
                        objectName: "Mantle_17_0"
                        position: Qt.vector3d(0.0630605, 0.0360831, 0.0240529)
                    }
                    Node {
                        id: mantle_17_1
                        objectName: "Mantle_17_1"
                        position: Qt.vector3d(0.0630605, 0.0314681, 0.0120265)
                    }
                    Node {
                        id: mantle_17_2
                        objectName: "Mantle_17_2"
                        position: Qt.vector3d(0.0630605, 0.0298544, 0)
                    }
                    Node {
                        id: mantle_17_3
                        objectName: "Mantle_17_3"
                        position: Qt.vector3d(0.0630605, 0.0317897, -0.0120265)
                    }
                    Node {
                        id: mantle_17_4
                        objectName: "Mantle_17_4"
                        position: Qt.vector3d(0.0630605, 0.0360831, -0.0240529)
                    }
                    Node {
                        id: mantle_18_0
                        objectName: "Mantle_18_0"
                        position: Qt.vector3d(0.0722013, 0.0272616, 0.0189598)
                    }
                    Node {
                        id: mantle_18_1
                        objectName: "Mantle_18_1"
                        position: Qt.vector3d(0.0722013, 0.0234508, 0.00947991)
                    }
                    Node {
                        id: mantle_18_2
                        objectName: "Mantle_18_2"
                        position: Qt.vector3d(0.0722013, 0.0222147, 0)
                    }
                    Node {
                        id: mantle_18_3
                        objectName: "Mantle_18_3"
                        position: Qt.vector3d(0.0722013, 0.0236602, -0.00947991)
                    }
                    Node {
                        id: mantle_18_4
                        objectName: "Mantle_18_4"
                        position: Qt.vector3d(0.0722013, 0.0272616, -0.0189598)
                    }
                    Node {
                        id: mantle_19_0
                        objectName: "Mantle_19_0"
                        position: Qt.vector3d(0.0815811, 0.0290294, 0.0199805)
                    }
                    Node {
                        id: mantle_19_1
                        objectName: "Mantle_19_1"
                        position: Qt.vector3d(0.0815811, 0.0253767, 0.00999023)
                    }
                    Node {
                        id: mantle_19_2
                        objectName: "Mantle_19_2"
                        position: Qt.vector3d(0.0815811, 0.0237457, 0)
                    }
                    Node {
                        id: mantle_19_3
                        objectName: "Mantle_19_3"
                        position: Qt.vector3d(0.0815811, 0.0250011, -0.00999023)
                    }
                    Node {
                        id: mantle_19_4
                        objectName: "Mantle_19_4"
                        position: Qt.vector3d(0.0815811, 0.0290294, -0.0199805)
                    }
                    Node {
                        id: mantle_20_0
                        objectName: "Mantle_20_0"
                        position: Qt.vector3d(0.0915, 0.00594039, 0.00665)
                    }
                    Node {
                        id: mantle_20_1
                        objectName: "Mantle_20_1"
                        position: Qt.vector3d(0.0915, 0.00460336, 0.003325)
                    }
                    Node {
                        id: mantle_20_2
                        objectName: "Mantle_20_2"
                        position: Qt.vector3d(0.0915, 0.00375, 0)
                    }
                    Node {
                        id: mantle_20_3
                        objectName: "Mantle_20_3"
                        position: Qt.vector3d(0.0915, 0.00449077, -0.003325)
                    }
                    Node {
                        id: mantle_20_4
                        objectName: "Mantle_20_4"
                        position: Qt.vector3d(0.0915, 0.00594039, -0.00665)
                    }
                    Node {
                        id: byssal_Anchor
                        objectName: "Byssal_Anchor"
                        position: Qt.vector3d(0, -0.004, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: hinge_Centre
                        objectName: "Hinge_Centre"
                        position: Qt.vector3d(0, -0.00325, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: hinge_Left
                        objectName: "Hinge_Left"
                        position: Qt.vector3d(-0.022, -0.00325, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: hinge_Right
                        objectName: "Hinge_Right"
                        position: Qt.vector3d(0.022, -0.00325, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: shell_Left
                        objectName: "Shell_Left"
                        position: Qt.vector3d(-0.09, 0.0036782, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: shell_Right
                        objectName: "Shell_Right"
                        position: Qt.vector3d(0.09, 0.0036782, 0)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                }
            }
        }
        Node {
            id: ground_Contact_Centre
            objectName: "Ground_Contact_Centre"
        }
    }

    // Animations:
    Timeline {
        id: idle_timeline
        objectName: "Idle"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 8000
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Idle"
        animations: TimelineAnimation {
            duration: 8000
            from: 0
            to: 8000
            running: node.animate && node.clip === "Idle"
            loops: -1
        }
        KeyframeGroup {
            target: root
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.vector3d(0, 0, 0) }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: body
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.004, 0) }
            Keyframe { frame: 8000; value: Qt.vector3d(0, 0.004, 0) }
        }
        KeyframeGroup {
            target: body
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: valve_Front
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.022, -0.00325, 0) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.022, -0.00325, 0) }
        }
        KeyframeGroup {
            target: valve_Front
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(0.5, -0.5, -0.5, -0.5) }
            Keyframe { frame: 8000; value: Qt.quaternion(0.5, -0.5, -0.5, -0.5) }
        }
        KeyframeGroup {
            target: valve_Back
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.022, -0.00325, 0) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.022, -0.00325, 0) }
        }
        KeyframeGroup {
            target: valve_Back
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(0.5, -0.5, -0.5, -0.5) }
            Keyframe { frame: 8000; value: Qt.quaternion(0.5, -0.5, -0.5, -0.5) }
        }
        KeyframeGroup {
            target: mantle_00_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0915, 0.00594039, 0.00665) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0915, 0.00594039, 0.00665) }
        }
        KeyframeGroup {
            target: mantle_00_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0915, 0.00442333, 0.003325) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0915, 0.00442333, 0.003325) }
        }
        KeyframeGroup {
            target: mantle_00_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0915, 0.00375, 0) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0915, 0.00375, 0) }
        }
        KeyframeGroup {
            target: mantle_00_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_3
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0915, 0.00431074, -0.003325) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0915, 0.00431074, -0.003325) }
        }
        KeyframeGroup {
            target: mantle_00_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0915, 0.00594039, -0.00665) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0915, 0.00594039, -0.00665) }
        }
        KeyframeGroup {
            target: mantle_00_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0815811, 0.0284801, 0.0196633) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0815811, 0.0284801, 0.0196633) }
        }
        KeyframeGroup {
            target: mantle_01_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0815811, 0.0249569, 0.00983166) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0815811, 0.0249569, 0.00983166) }
        }
        KeyframeGroup {
            target: mantle_01_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0815811, 0.02327, 0) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0815811, 0.02327, 0) }
        }
        KeyframeGroup {
            target: mantle_01_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_3
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0815811, 0.0245813, -0.00983166) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0815811, 0.0245813, -0.00983166) }
        }
        KeyframeGroup {
            target: mantle_01_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0815811, 0.0284801, -0.0196633) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0815811, 0.0284801, -0.0196633) }
        }
        KeyframeGroup {
            target: mantle_01_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0722013, 0.0380902, 0.0252117) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0722013, 0.0380902, 0.0252117) }
        }
        KeyframeGroup {
            target: mantle_02_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0722013, 0.0380902, -0.0252117) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0722013, 0.0380902, -0.0252117) }
        }
        KeyframeGroup {
            target: mantle_02_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0630605, 0.0325714, 0.0220254) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0630605, 0.0325714, 0.0220254) }
        }
        KeyframeGroup {
            target: mantle_03_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0630605, 0.0325714, -0.0220254) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0630605, 0.0325714, -0.0220254) }
        }
        KeyframeGroup {
            target: mantle_03_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0540151, 0.0453945, 0.0294288) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0540151, 0.0453945, 0.0294288) }
        }
        KeyframeGroup {
            target: mantle_04_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0540151, 0.0453945, -0.0294288) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0540151, 0.0453945, -0.0294288) }
        }
        KeyframeGroup {
            target: mantle_04_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0450029, 0.056017, 0.0355617) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0450029, 0.056017, 0.0355617) }
        }
        KeyframeGroup {
            target: mantle_05_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0450029, 0.056017, -0.0355617) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0450029, 0.056017, -0.0355617) }
        }
        KeyframeGroup {
            target: mantle_05_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0360004, 0.0575593, 0.0364522) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0360004, 0.0575593, 0.0364522) }
        }
        KeyframeGroup {
            target: mantle_06_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.0360004, 0.0575593, -0.0364522) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.0360004, 0.0575593, -0.0364522) }
        }
        KeyframeGroup {
            target: mantle_06_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.027, 0.046824, 0.0302541) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.027, 0.046824, 0.0302541) }
        }
        KeyframeGroup {
            target: mantle_07_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.027, 0.046824, -0.0302541) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.027, 0.046824, -0.0302541) }
        }
        KeyframeGroup {
            target: mantle_07_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.018, 0.0419015, 0.0274122) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.018, 0.0419015, 0.0274122) }
        }
        KeyframeGroup {
            target: mantle_08_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.018, 0.0419015, -0.0274122) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.018, 0.0419015, -0.0274122) }
        }
        KeyframeGroup {
            target: mantle_08_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.009, 0.0480589, 0.0309672) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.009, 0.0480589, 0.0309672) }
        }
        KeyframeGroup {
            target: mantle_09_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(-0.009, 0.0480589, -0.0309672) }
            Keyframe { frame: 8000; value: Qt.vector3d(-0.009, 0.0480589, -0.0309672) }
        }
        KeyframeGroup {
            target: mantle_09_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0612945, 0.0386087) }
            Keyframe { frame: 8000; value: Qt.vector3d(0, 0.0612945, 0.0386087) }
        }
        KeyframeGroup {
            target: mantle_10_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.0612945, -0.0386087) }
            Keyframe { frame: 8000; value: Qt.vector3d(0, 0.0612945, -0.0386087) }
        }
        KeyframeGroup {
            target: mantle_10_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.009, 0.0624926, 0.0393004) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.009, 0.0624926, 0.0393004) }
        }
        KeyframeGroup {
            target: mantle_11_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.009, 0.0624926, -0.0393004) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.009, 0.0624926, -0.0393004) }
        }
        KeyframeGroup {
            target: mantle_11_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.018, 0.0450705, 0.0292418) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.018, 0.0450705, 0.0292418) }
        }
        KeyframeGroup {
            target: mantle_12_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.018, 0.0450705, -0.0292418) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.018, 0.0450705, -0.0292418) }
        }
        KeyframeGroup {
            target: mantle_12_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.027, 0.0346726, 0.0232386) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.027, 0.0346726, 0.0232386) }
        }
        KeyframeGroup {
            target: mantle_13_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.027, 0.0346726, -0.0232386) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.027, 0.0346726, -0.0232386) }
        }
        KeyframeGroup {
            target: mantle_13_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0360004, 0.0536574, 0.0341995) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0360004, 0.0536574, 0.0341995) }
        }
        KeyframeGroup {
            target: mantle_14_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0360004, 0.0536574, -0.0341995) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0360004, 0.0536574, -0.0341995) }
        }
        KeyframeGroup {
            target: mantle_14_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0450029, 0.0591999, 0.0373994) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0450029, 0.0591999, 0.0373994) }
        }
        KeyframeGroup {
            target: mantle_15_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0450029, 0.0591999, -0.0373994) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0450029, 0.0591999, -0.0373994) }
        }
        KeyframeGroup {
            target: mantle_15_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0540151, 0.0558574, 0.0354696) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0540151, 0.0558574, 0.0354696) }
        }
        KeyframeGroup {
            target: mantle_16_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0540151, 0.0558574, -0.0354696) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0540151, 0.0558574, -0.0354696) }
        }
        KeyframeGroup {
            target: mantle_16_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0630605, 0.0360831, 0.0240529) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0630605, 0.0360831, 0.0240529) }
        }
        KeyframeGroup {
            target: mantle_17_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0630605, 0.0360831, -0.0240529) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0630605, 0.0360831, -0.0240529) }
        }
        KeyframeGroup {
            target: mantle_17_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0722013, 0.0272616, 0.0189598) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0722013, 0.0272616, 0.0189598) }
        }
        KeyframeGroup {
            target: mantle_18_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0722013, 0.0272616, -0.0189598) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0722013, 0.0272616, -0.0189598) }
        }
        KeyframeGroup {
            target: mantle_18_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0815811, 0.0290294, 0.0199805) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0815811, 0.0290294, 0.0199805) }
        }
        KeyframeGroup {
            target: mantle_19_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0815811, 0.0253767, 0.00999023) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0815811, 0.0253767, 0.00999023) }
        }
        KeyframeGroup {
            target: mantle_19_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0815811, 0.0237457, 0) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0815811, 0.0237457, 0) }
        }
        KeyframeGroup {
            target: mantle_19_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_3
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0815811, 0.0250011, -0.00999023) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0815811, 0.0250011, -0.00999023) }
        }
        KeyframeGroup {
            target: mantle_19_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0815811, 0.0290294, -0.0199805) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0815811, 0.0290294, -0.0199805) }
        }
        KeyframeGroup {
            target: mantle_19_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_0
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0915, 0.00594039, 0.00665) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0915, 0.00594039, 0.00665) }
        }
        KeyframeGroup {
            target: mantle_20_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_1
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0915, 0.00460336, 0.003325) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0915, 0.00460336, 0.003325) }
        }
        KeyframeGroup {
            target: mantle_20_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_2
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0915, 0.00375, 0) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0915, 0.00375, 0) }
        }
        KeyframeGroup {
            target: mantle_20_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_3
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0915, 0.00449077, -0.003325) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0915, 0.00449077, -0.003325) }
        }
        KeyframeGroup {
            target: mantle_20_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_4
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0.0915, 0.00594039, -0.00665) }
            Keyframe { frame: 8000; value: Qt.vector3d(0.0915, 0.00594039, -0.00665) }
        }
        KeyframeGroup {
            target: mantle_20_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 8000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_3
            property: "position"
            keyframeSource: "animations/mantle_18_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_18_2
            property: "position"
            keyframeSource: "animations/mantle_18_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_18_1
            property: "position"
            keyframeSource: "animations/mantle_18_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_17_3
            property: "position"
            keyframeSource: "animations/mantle_17_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_17_2
            property: "position"
            keyframeSource: "animations/mantle_17_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_17_1
            property: "position"
            keyframeSource: "animations/mantle_17_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_16_3
            property: "position"
            keyframeSource: "animations/mantle_16_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_16_2
            property: "position"
            keyframeSource: "animations/mantle_16_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_16_1
            property: "position"
            keyframeSource: "animations/mantle_16_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_15_3
            property: "position"
            keyframeSource: "animations/mantle_15_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_15_2
            property: "position"
            keyframeSource: "animations/mantle_15_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_15_1
            property: "position"
            keyframeSource: "animations/mantle_15_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_14_3
            property: "position"
            keyframeSource: "animations/mantle_14_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_14_2
            property: "position"
            keyframeSource: "animations/mantle_14_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_14_1
            property: "position"
            keyframeSource: "animations/mantle_14_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_13_3
            property: "position"
            keyframeSource: "animations/mantle_13_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_13_2
            property: "position"
            keyframeSource: "animations/mantle_13_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_13_1
            property: "position"
            keyframeSource: "animations/mantle_13_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_12_3
            property: "position"
            keyframeSource: "animations/mantle_12_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_12_2
            property: "position"
            keyframeSource: "animations/mantle_12_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_12_1
            property: "position"
            keyframeSource: "animations/mantle_12_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_11_3
            property: "position"
            keyframeSource: "animations/mantle_11_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_11_2
            property: "position"
            keyframeSource: "animations/mantle_11_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_11_1
            property: "position"
            keyframeSource: "animations/mantle_11_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_04_3
            property: "position"
            keyframeSource: "animations/mantle_04_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_04_2
            property: "position"
            keyframeSource: "animations/mantle_04_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_04_1
            property: "position"
            keyframeSource: "animations/mantle_04_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_03_3
            property: "position"
            keyframeSource: "animations/mantle_03_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_03_2
            property: "position"
            keyframeSource: "animations/mantle_03_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_03_1
            property: "position"
            keyframeSource: "animations/mantle_03_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_02_3
            property: "position"
            keyframeSource: "animations/mantle_02_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_02_2
            property: "position"
            keyframeSource: "animations/mantle_02_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_02_1
            property: "position"
            keyframeSource: "animations/mantle_02_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_10_3
            property: "position"
            keyframeSource: "animations/mantle_10_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_10_2
            property: "position"
            keyframeSource: "animations/mantle_10_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_05_1
            property: "position"
            keyframeSource: "animations/mantle_05_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_05_2
            property: "position"
            keyframeSource: "animations/mantle_05_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_05_3
            property: "position"
            keyframeSource: "animations/mantle_05_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_06_1
            property: "position"
            keyframeSource: "animations/mantle_06_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_06_2
            property: "position"
            keyframeSource: "animations/mantle_06_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_06_3
            property: "position"
            keyframeSource: "animations/mantle_06_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_07_1
            property: "position"
            keyframeSource: "animations/mantle_07_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_07_2
            property: "position"
            keyframeSource: "animations/mantle_07_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_07_3
            property: "position"
            keyframeSource: "animations/mantle_07_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_08_1
            property: "position"
            keyframeSource: "animations/mantle_08_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_08_2
            property: "position"
            keyframeSource: "animations/mantle_08_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_08_3
            property: "position"
            keyframeSource: "animations/mantle_08_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_09_1
            property: "position"
            keyframeSource: "animations/mantle_09_1_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_09_2
            property: "position"
            keyframeSource: "animations/mantle_09_2_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_09_3
            property: "position"
            keyframeSource: "animations/mantle_09_3_position_0.qad"
        }
        KeyframeGroup {
            target: mantle_10_1
            property: "position"
            keyframeSource: "animations/mantle_10_1_position_0.qad"
        }
    }
    Timeline {
        id: close_timeline
        objectName: "Close"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1250
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Close"
        animations: TimelineAnimation {
            duration: 1250
            from: 0
            to: 1250
            running: node.animate && node.clip === "Close"
            loops: 1
        }
        KeyframeGroup {
            target: root
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.vector3d(0, 0, 0) }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: body
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.004, 0) }
            Keyframe { frame: 1250; value: Qt.vector3d(0, 0.004, 0) }
        }
        KeyframeGroup {
            target: body
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 1250; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_4
            property: "position"
            keyframeSource: "animations/mantle_20_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_20_3
            property: "position"
            keyframeSource: "animations/mantle_20_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_20_2
            property: "position"
            keyframeSource: "animations/mantle_20_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_20_1
            property: "position"
            keyframeSource: "animations/mantle_20_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_20_0
            property: "position"
            keyframeSource: "animations/mantle_20_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_19_4
            property: "position"
            keyframeSource: "animations/mantle_19_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_19_3
            property: "position"
            keyframeSource: "animations/mantle_19_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_19_2
            property: "position"
            keyframeSource: "animations/mantle_19_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_19_1
            property: "position"
            keyframeSource: "animations/mantle_19_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_19_0
            property: "position"
            keyframeSource: "animations/mantle_19_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_18_4
            property: "position"
            keyframeSource: "animations/mantle_18_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_18_3
            property: "position"
            keyframeSource: "animations/mantle_18_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_18_2
            property: "position"
            keyframeSource: "animations/mantle_18_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_18_1
            property: "position"
            keyframeSource: "animations/mantle_18_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_18_0
            property: "position"
            keyframeSource: "animations/mantle_18_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_17_4
            property: "position"
            keyframeSource: "animations/mantle_17_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_17_3
            property: "position"
            keyframeSource: "animations/mantle_17_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_17_2
            property: "position"
            keyframeSource: "animations/mantle_17_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_17_1
            property: "position"
            keyframeSource: "animations/mantle_17_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_17_0
            property: "position"
            keyframeSource: "animations/mantle_17_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_16_4
            property: "position"
            keyframeSource: "animations/mantle_16_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_16_3
            property: "position"
            keyframeSource: "animations/mantle_16_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_16_2
            property: "position"
            keyframeSource: "animations/mantle_16_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_16_1
            property: "position"
            keyframeSource: "animations/mantle_16_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_16_0
            property: "position"
            keyframeSource: "animations/mantle_16_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_15_4
            property: "position"
            keyframeSource: "animations/mantle_15_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_15_3
            property: "position"
            keyframeSource: "animations/mantle_15_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_15_2
            property: "position"
            keyframeSource: "animations/mantle_15_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_15_1
            property: "position"
            keyframeSource: "animations/mantle_15_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_15_0
            property: "position"
            keyframeSource: "animations/mantle_15_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_14_4
            property: "position"
            keyframeSource: "animations/mantle_14_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_14_3
            property: "position"
            keyframeSource: "animations/mantle_14_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_14_2
            property: "position"
            keyframeSource: "animations/mantle_14_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_14_1
            property: "position"
            keyframeSource: "animations/mantle_14_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_14_0
            property: "position"
            keyframeSource: "animations/mantle_14_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_13_4
            property: "position"
            keyframeSource: "animations/mantle_13_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_13_3
            property: "position"
            keyframeSource: "animations/mantle_13_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_13_2
            property: "position"
            keyframeSource: "animations/mantle_13_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_13_1
            property: "position"
            keyframeSource: "animations/mantle_13_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_13_0
            property: "position"
            keyframeSource: "animations/mantle_13_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_12_4
            property: "position"
            keyframeSource: "animations/mantle_12_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_12_3
            property: "position"
            keyframeSource: "animations/mantle_12_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_12_2
            property: "position"
            keyframeSource: "animations/mantle_12_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_12_1
            property: "position"
            keyframeSource: "animations/mantle_12_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_12_0
            property: "position"
            keyframeSource: "animations/mantle_12_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_11_4
            property: "position"
            keyframeSource: "animations/mantle_11_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_11_3
            property: "position"
            keyframeSource: "animations/mantle_11_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_11_2
            property: "position"
            keyframeSource: "animations/mantle_11_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_11_1
            property: "position"
            keyframeSource: "animations/mantle_11_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_11_0
            property: "position"
            keyframeSource: "animations/mantle_11_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_04_3
            property: "position"
            keyframeSource: "animations/mantle_04_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_04_2
            property: "position"
            keyframeSource: "animations/mantle_04_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_04_1
            property: "position"
            keyframeSource: "animations/mantle_04_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_04_0
            property: "position"
            keyframeSource: "animations/mantle_04_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_03_4
            property: "position"
            keyframeSource: "animations/mantle_03_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_03_3
            property: "position"
            keyframeSource: "animations/mantle_03_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_03_2
            property: "position"
            keyframeSource: "animations/mantle_03_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_03_1
            property: "position"
            keyframeSource: "animations/mantle_03_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_03_0
            property: "position"
            keyframeSource: "animations/mantle_03_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_02_4
            property: "position"
            keyframeSource: "animations/mantle_02_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_02_3
            property: "position"
            keyframeSource: "animations/mantle_02_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_02_2
            property: "position"
            keyframeSource: "animations/mantle_02_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_02_1
            property: "position"
            keyframeSource: "animations/mantle_02_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_02_0
            property: "position"
            keyframeSource: "animations/mantle_02_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_01_4
            property: "position"
            keyframeSource: "animations/mantle_01_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_10_3
            property: "position"
            keyframeSource: "animations/mantle_10_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_01_3
            property: "position"
            keyframeSource: "animations/mantle_01_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_04_4
            property: "position"
            keyframeSource: "animations/mantle_04_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_10_2
            property: "position"
            keyframeSource: "animations/mantle_10_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_01_2
            property: "position"
            keyframeSource: "animations/mantle_01_2_position_1.qad"
        }
        KeyframeGroup {
            target: valve_Front
            property: "position"
            keyframeSource: "animations/valve_Front_position_1.qad"
        }
        KeyframeGroup {
            target: valve_Front
            property: "rotation"
            keyframeSource: "animations/valve_Front_rotation_1.qad"
        }
        KeyframeGroup {
            target: valve_Back
            property: "position"
            keyframeSource: "animations/valve_Back_position_1.qad"
        }
        KeyframeGroup {
            target: valve_Back
            property: "rotation"
            keyframeSource: "animations/valve_Back_rotation_1.qad"
        }
        KeyframeGroup {
            target: mantle_00_0
            property: "position"
            keyframeSource: "animations/mantle_00_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_00_1
            property: "position"
            keyframeSource: "animations/mantle_00_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_00_2
            property: "position"
            keyframeSource: "animations/mantle_00_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_00_3
            property: "position"
            keyframeSource: "animations/mantle_00_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_00_4
            property: "position"
            keyframeSource: "animations/mantle_00_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_01_0
            property: "position"
            keyframeSource: "animations/mantle_01_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_01_1
            property: "position"
            keyframeSource: "animations/mantle_01_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_05_0
            property: "position"
            keyframeSource: "animations/mantle_05_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_05_1
            property: "position"
            keyframeSource: "animations/mantle_05_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_05_2
            property: "position"
            keyframeSource: "animations/mantle_05_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_05_3
            property: "position"
            keyframeSource: "animations/mantle_05_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_05_4
            property: "position"
            keyframeSource: "animations/mantle_05_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_06_0
            property: "position"
            keyframeSource: "animations/mantle_06_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_06_1
            property: "position"
            keyframeSource: "animations/mantle_06_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_06_2
            property: "position"
            keyframeSource: "animations/mantle_06_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_06_3
            property: "position"
            keyframeSource: "animations/mantle_06_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_06_4
            property: "position"
            keyframeSource: "animations/mantle_06_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_07_0
            property: "position"
            keyframeSource: "animations/mantle_07_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_07_1
            property: "position"
            keyframeSource: "animations/mantle_07_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_07_2
            property: "position"
            keyframeSource: "animations/mantle_07_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_07_3
            property: "position"
            keyframeSource: "animations/mantle_07_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_07_4
            property: "position"
            keyframeSource: "animations/mantle_07_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_08_0
            property: "position"
            keyframeSource: "animations/mantle_08_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_08_1
            property: "position"
            keyframeSource: "animations/mantle_08_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_08_2
            property: "position"
            keyframeSource: "animations/mantle_08_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_08_3
            property: "position"
            keyframeSource: "animations/mantle_08_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_08_4
            property: "position"
            keyframeSource: "animations/mantle_08_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_09_0
            property: "position"
            keyframeSource: "animations/mantle_09_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_09_1
            property: "position"
            keyframeSource: "animations/mantle_09_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_09_2
            property: "position"
            keyframeSource: "animations/mantle_09_2_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_09_3
            property: "position"
            keyframeSource: "animations/mantle_09_3_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_09_4
            property: "position"
            keyframeSource: "animations/mantle_09_4_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_10_0
            property: "position"
            keyframeSource: "animations/mantle_10_0_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_10_1
            property: "position"
            keyframeSource: "animations/mantle_10_1_position_1.qad"
        }
        KeyframeGroup {
            target: mantle_10_4
            property: "position"
            keyframeSource: "animations/mantle_10_4_position_1.qad"
        }
    }
    Timeline {
        id: open_timeline
        objectName: "Open"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 3000
        currentFrame: node.poseTimeMs
        enabled: node.clip === "Open"
        animations: TimelineAnimation {
            duration: 3000
            from: 0
            to: 3000
            running: node.animate && node.clip === "Open"
            loops: 1
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
            target: body
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0.004, 0) }
            Keyframe { frame: 3000; value: Qt.vector3d(0, 0.004, 0) }
        }
        KeyframeGroup {
            target: body
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_00_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_01_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_02_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_03_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_04_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_05_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_06_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_07_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_08_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_09_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_10_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_11_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_12_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_13_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_14_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_15_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_16_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_17_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_18_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_19_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_0
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_1
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_2
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_3
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_4
            property: "rotation"
            Keyframe { frame: 0; value: Qt.quaternion(1, 0, 0, 0) }
            Keyframe { frame: 3000; value: Qt.quaternion(1, 0, 0, 0) }
        }
        KeyframeGroup {
            target: mantle_20_4
            property: "position"
            keyframeSource: "animations/mantle_20_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_20_3
            property: "position"
            keyframeSource: "animations/mantle_20_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_20_2
            property: "position"
            keyframeSource: "animations/mantle_20_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_20_1
            property: "position"
            keyframeSource: "animations/mantle_20_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_20_0
            property: "position"
            keyframeSource: "animations/mantle_20_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_19_4
            property: "position"
            keyframeSource: "animations/mantle_19_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_19_3
            property: "position"
            keyframeSource: "animations/mantle_19_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_19_2
            property: "position"
            keyframeSource: "animations/mantle_19_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_19_1
            property: "position"
            keyframeSource: "animations/mantle_19_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_19_0
            property: "position"
            keyframeSource: "animations/mantle_19_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_18_4
            property: "position"
            keyframeSource: "animations/mantle_18_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_18_3
            property: "position"
            keyframeSource: "animations/mantle_18_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_18_2
            property: "position"
            keyframeSource: "animations/mantle_18_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_18_1
            property: "position"
            keyframeSource: "animations/mantle_18_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_18_0
            property: "position"
            keyframeSource: "animations/mantle_18_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_17_4
            property: "position"
            keyframeSource: "animations/mantle_17_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_17_3
            property: "position"
            keyframeSource: "animations/mantle_17_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_17_2
            property: "position"
            keyframeSource: "animations/mantle_17_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_17_1
            property: "position"
            keyframeSource: "animations/mantle_17_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_17_0
            property: "position"
            keyframeSource: "animations/mantle_17_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_16_4
            property: "position"
            keyframeSource: "animations/mantle_16_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_16_3
            property: "position"
            keyframeSource: "animations/mantle_16_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_16_2
            property: "position"
            keyframeSource: "animations/mantle_16_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_16_1
            property: "position"
            keyframeSource: "animations/mantle_16_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_16_0
            property: "position"
            keyframeSource: "animations/mantle_16_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_15_4
            property: "position"
            keyframeSource: "animations/mantle_15_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_15_3
            property: "position"
            keyframeSource: "animations/mantle_15_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_15_2
            property: "position"
            keyframeSource: "animations/mantle_15_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_15_1
            property: "position"
            keyframeSource: "animations/mantle_15_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_15_0
            property: "position"
            keyframeSource: "animations/mantle_15_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_14_4
            property: "position"
            keyframeSource: "animations/mantle_14_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_14_3
            property: "position"
            keyframeSource: "animations/mantle_14_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_14_2
            property: "position"
            keyframeSource: "animations/mantle_14_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_14_1
            property: "position"
            keyframeSource: "animations/mantle_14_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_14_0
            property: "position"
            keyframeSource: "animations/mantle_14_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_13_4
            property: "position"
            keyframeSource: "animations/mantle_13_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_13_3
            property: "position"
            keyframeSource: "animations/mantle_13_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_13_2
            property: "position"
            keyframeSource: "animations/mantle_13_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_13_1
            property: "position"
            keyframeSource: "animations/mantle_13_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_13_0
            property: "position"
            keyframeSource: "animations/mantle_13_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_12_4
            property: "position"
            keyframeSource: "animations/mantle_12_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_12_3
            property: "position"
            keyframeSource: "animations/mantle_12_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_12_2
            property: "position"
            keyframeSource: "animations/mantle_12_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_12_1
            property: "position"
            keyframeSource: "animations/mantle_12_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_12_0
            property: "position"
            keyframeSource: "animations/mantle_12_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_11_4
            property: "position"
            keyframeSource: "animations/mantle_11_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_11_3
            property: "position"
            keyframeSource: "animations/mantle_11_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_11_2
            property: "position"
            keyframeSource: "animations/mantle_11_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_11_1
            property: "position"
            keyframeSource: "animations/mantle_11_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_11_0
            property: "position"
            keyframeSource: "animations/mantle_11_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_04_3
            property: "position"
            keyframeSource: "animations/mantle_04_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_04_2
            property: "position"
            keyframeSource: "animations/mantle_04_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_04_1
            property: "position"
            keyframeSource: "animations/mantle_04_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_04_0
            property: "position"
            keyframeSource: "animations/mantle_04_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_03_4
            property: "position"
            keyframeSource: "animations/mantle_03_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_03_3
            property: "position"
            keyframeSource: "animations/mantle_03_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_03_2
            property: "position"
            keyframeSource: "animations/mantle_03_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_03_1
            property: "position"
            keyframeSource: "animations/mantle_03_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_03_0
            property: "position"
            keyframeSource: "animations/mantle_03_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_02_4
            property: "position"
            keyframeSource: "animations/mantle_02_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_02_3
            property: "position"
            keyframeSource: "animations/mantle_02_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_02_2
            property: "position"
            keyframeSource: "animations/mantle_02_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_02_1
            property: "position"
            keyframeSource: "animations/mantle_02_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_02_0
            property: "position"
            keyframeSource: "animations/mantle_02_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_01_4
            property: "position"
            keyframeSource: "animations/mantle_01_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_10_3
            property: "position"
            keyframeSource: "animations/mantle_10_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_01_3
            property: "position"
            keyframeSource: "animations/mantle_01_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_04_4
            property: "position"
            keyframeSource: "animations/mantle_04_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_10_2
            property: "position"
            keyframeSource: "animations/mantle_10_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_01_2
            property: "position"
            keyframeSource: "animations/mantle_01_2_position_2.qad"
        }
        KeyframeGroup {
            target: valve_Front
            property: "position"
            keyframeSource: "animations/valve_Front_position_2.qad"
        }
        KeyframeGroup {
            target: valve_Front
            property: "rotation"
            keyframeSource: "animations/valve_Front_rotation_2.qad"
        }
        KeyframeGroup {
            target: valve_Back
            property: "position"
            keyframeSource: "animations/valve_Back_position_2.qad"
        }
        KeyframeGroup {
            target: valve_Back
            property: "rotation"
            keyframeSource: "animations/valve_Back_rotation_2.qad"
        }
        KeyframeGroup {
            target: mantle_00_0
            property: "position"
            keyframeSource: "animations/mantle_00_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_00_1
            property: "position"
            keyframeSource: "animations/mantle_00_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_00_2
            property: "position"
            keyframeSource: "animations/mantle_00_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_00_3
            property: "position"
            keyframeSource: "animations/mantle_00_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_00_4
            property: "position"
            keyframeSource: "animations/mantle_00_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_01_0
            property: "position"
            keyframeSource: "animations/mantle_01_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_01_1
            property: "position"
            keyframeSource: "animations/mantle_01_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_05_0
            property: "position"
            keyframeSource: "animations/mantle_05_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_05_1
            property: "position"
            keyframeSource: "animations/mantle_05_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_05_2
            property: "position"
            keyframeSource: "animations/mantle_05_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_05_3
            property: "position"
            keyframeSource: "animations/mantle_05_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_05_4
            property: "position"
            keyframeSource: "animations/mantle_05_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_06_0
            property: "position"
            keyframeSource: "animations/mantle_06_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_06_1
            property: "position"
            keyframeSource: "animations/mantle_06_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_06_2
            property: "position"
            keyframeSource: "animations/mantle_06_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_06_3
            property: "position"
            keyframeSource: "animations/mantle_06_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_06_4
            property: "position"
            keyframeSource: "animations/mantle_06_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_07_0
            property: "position"
            keyframeSource: "animations/mantle_07_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_07_1
            property: "position"
            keyframeSource: "animations/mantle_07_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_07_2
            property: "position"
            keyframeSource: "animations/mantle_07_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_07_3
            property: "position"
            keyframeSource: "animations/mantle_07_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_07_4
            property: "position"
            keyframeSource: "animations/mantle_07_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_08_0
            property: "position"
            keyframeSource: "animations/mantle_08_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_08_1
            property: "position"
            keyframeSource: "animations/mantle_08_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_08_2
            property: "position"
            keyframeSource: "animations/mantle_08_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_08_3
            property: "position"
            keyframeSource: "animations/mantle_08_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_08_4
            property: "position"
            keyframeSource: "animations/mantle_08_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_09_0
            property: "position"
            keyframeSource: "animations/mantle_09_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_09_1
            property: "position"
            keyframeSource: "animations/mantle_09_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_09_2
            property: "position"
            keyframeSource: "animations/mantle_09_2_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_09_3
            property: "position"
            keyframeSource: "animations/mantle_09_3_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_09_4
            property: "position"
            keyframeSource: "animations/mantle_09_4_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_10_0
            property: "position"
            keyframeSource: "animations/mantle_10_0_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_10_1
            property: "position"
            keyframeSource: "animations/mantle_10_1_position_2.qad"
        }
        KeyframeGroup {
            target: mantle_10_4
            property: "position"
            keyframeSource: "animations/mantle_10_4_position_2.qad"
        }
    }
}
