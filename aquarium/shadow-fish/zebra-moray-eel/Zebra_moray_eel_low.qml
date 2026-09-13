import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node
    property bool shadowAlphaMask: true
    property string clip: "Idle"
    property bool animate: true
    property real poseTimeMs: 0
    property real tankColourLift: 1
    property real caveLight: 1
    property bool referenceSkin: true

    // Resources
    property url textureData: "../../fish/zebra-moray-eel/maps/textureData.png"
    property url textureData4: referenceSkin ? "../../fish/zebra-moray-eel/maps/moray-spotted-basecolor.png" : "../../fish/zebra-moray-eel/maps/textureData4.png"
    property url textureData6: "../../fish/zebra-moray-eel/maps/textureData6.png"
    property url textureData13: "../../fish/zebra-moray-eel/maps/textureData13.png"
    property url textureData8: "../../fish/zebra-moray-eel/maps/textureData8.png"
    property url textureData11: "../../fish/zebra-moray-eel/maps/textureData11.png"
    Texture {
        id: _0_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData4
    }
    Texture {
        id: _5_texture
        tilingModeHorizontal: Texture.ClampToEdge
        tilingModeVertical: Texture.ClampToEdge
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData
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
        id: zebraMoray_eye_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: zebraMoray_body_low_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: gill_rim_tissue_002_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: gill_rim_tissue_003_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: rounded_ivory_molars_material
        shadingMode: CustomMaterial.Shaded
        cullMode: Material.NoCulling
        depthDrawMode: Material.OpaqueOnlyDepthDraw
        fragmentShader: "../../fish-shadow.frag"
        property bool finMembrane: node.shadowAlphaMask && false
        property TextureInput shadowPigment: TextureInput { enabled: false }
    }
    CustomMaterial {
        id: mouth_and_openings_material
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
            head,
            spine01,
            spine02,
            spine03,
            spine04,
            spine05,
            spine06,
            spine07,
            spine08,
            spine09,
            spine10,
            spine11,
            spine12,
            spine13,
            spine14,
            spine15,
            spine16,
            spine17,
            spine18,
            spine19,
            spine20,
            spine21,
            spine22,
            spine23,
            spine24,
            spine25,
            spine26,
            spine27,
            spine28,
            spine29,
            spine30,
            spine31,
            spine32,
            jaw
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.263783, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.215493, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.199185, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.182878, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.16657, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.150263, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.133955, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.117648, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.10134, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0850328, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0687253, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0524177, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0361102, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.0198027, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, 0.00349516, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0128124, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0291199, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0454274, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0617349, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.0780424, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.09435, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.110657, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.126965, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.143273, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.15958, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.175888, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.192195, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.208503, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.22481, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.241118, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.257425, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.273733, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.29004, 0, 1, 0, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0.0575964, 0.99834, -0.20577, 0, -0.998337, 0.0575964, -0.0175397, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Model {
        id: zebraMoray_Root
        objectName: "ZebraMoray_Root"
        source: "../../fish/zebra-moray-eel/meshes/zebraMoray_Root_mesh.mesh"
        skin: skin
        materials: [
            zebraMoray_body_low_material,
            zebraMoray_eye_low_material,
            gill_rim_tissue_002_material,
            gill_rim_tissue_003_material,
            rounded_ivory_molars_material,
            mouth_and_openings_material
        ]
        Node {
            id: zebraMoray_Rig
            objectName: "ZebraMoray_Rig"
            Node {
                id: root
                objectName: "Root"
                Node {
                    id: head
                    objectName: "Head"
                    position: Qt.vector3d(0, 0, 0.263783)
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: spine01
                        objectName: "Spine01"
                        position: Qt.vector3d(0, 0.0482897, 0)
                        Node {
                            id: spine02
                            objectName: "Spine02"
                            position: Qt.vector3d(0, 0.0163075, 0)
                            Node {
                                id: spine03
                                objectName: "Spine03"
                                position: Qt.vector3d(0, 0.0163075, 0)
                                Node {
                                    id: spine04
                                    objectName: "Spine04"
                                    position: Qt.vector3d(0, 0.0163075, 0)
                                    Node {
                                        id: spine05
                                        objectName: "Spine05"
                                        position: Qt.vector3d(0, 0.0163075, 0)
                                        Node {
                                            id: spine06
                                            objectName: "Spine06"
                                            position: Qt.vector3d(0, 0.0163075, 0)
                                            Node {
                                                id: spine07
                                                objectName: "Spine07"
                                                position: Qt.vector3d(0, 0.0163075, 0)
                                                Node {
                                                    id: spine08
                                                    objectName: "Spine08"
                                                    position: Qt.vector3d(0, 0.0163075, 0)
                                                    Node {
                                                        id: spine09
                                                        objectName: "Spine09"
                                                        position: Qt.vector3d(0, 0.0163075, 0)
                                                        Node {
                                                            id: spine10
                                                            objectName: "Spine10"
                                                            position: Qt.vector3d(0, 0.0163075, 0)
                                                            Node {
                                                                id: spine11
                                                                objectName: "Spine11"
                                                                position: Qt.vector3d(0, 0.0163075, 0)
                                                                Node {
                                                                    id: spine12
                                                                    objectName: "Spine12"
                                                                    position: Qt.vector3d(0, 0.0163075, 0)
                                                                    Node {
                                                                        id: spine13
                                                                        objectName: "Spine13"
                                                                        position: Qt.vector3d(0, 0.0163075, 0)
                                                                        Node {
                                                                            id: spine14
                                                                            objectName: "Spine14"
                                                                            position: Qt.vector3d(0, 0.0163075, 0)
                                                                            Node {
                                                                                id: spine15
                                                                                objectName: "Spine15"
                                                                                position: Qt.vector3d(0, 0.0163075, 0)
                                                                                Node {
                                                                                    id: spine16
                                                                                    objectName: "Spine16"
                                                                                    position: Qt.vector3d(0, 0.0163075, 0)
                                                                                    Node {
                                                                                        id: spine17
                                                                                        objectName: "Spine17"
                                                                                        position: Qt.vector3d(0, 0.0163075, 0)
                                                                                        Node {
                                                                                            id: spine18
                                                                                            objectName: "Spine18"
                                                                                            position: Qt.vector3d(0, 0.0163075, 0)
                                                                                            Node {
                                                                                                id: spine19
                                                                                                objectName: "Spine19"
                                                                                                position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                Node {
                                                                                                    id: spine20
                                                                                                    objectName: "Spine20"
                                                                                                    position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                    Node {
                                                                                                        id: spine21
                                                                                                        objectName: "Spine21"
                                                                                                        position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                        Node {
                                                                                                            id: spine22
                                                                                                            objectName: "Spine22"
                                                                                                            position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                            Node {
                                                                                                                id: spine23
                                                                                                                objectName: "Spine23"
                                                                                                                position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                Node {
                                                                                                                    id: spine24
                                                                                                                    objectName: "Spine24"
                                                                                                                    position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                    Node {
                                                                                                                        id: spine25
                                                                                                                        objectName: "Spine25"
                                                                                                                        position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                        Node {
                                                                                                                            id: spine26
                                                                                                                            objectName: "Spine26"
                                                                                                                            position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                            Node {
                                                                                                                                id: spine27
                                                                                                                                objectName: "Spine27"
                                                                                                                                position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                                Node {
                                                                                                                                    id: spine28
                                                                                                                                    objectName: "Spine28"
                                                                                                                                    position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                                    Node {
                                                                                                                                        id: spine29
                                                                                                                                        objectName: "Spine29"
                                                                                                                                        position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                                        Node {
                                                                                                                                            id: spine30
                                                                                                                                            objectName: "Spine30"
                                                                                                                                            position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                                            Node {
                                                                                                                                                id: spine31
                                                                                                                                                objectName: "Spine31"
                                                                                                                                                position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                                                Node {
                                                                                                                                                    id: spine32
                                                                                                                                                    objectName: "Spine32"
                                                                                                                                                    position: Qt.vector3d(0, 0.0163075, 0)
                                                                                                                                                    Node {
                                                                                                                                                        id: tail_Tip
                                                                                                                                                        objectName: "Tail_Tip"
                                                                                                                                                        position: Qt.vector3d(0, 0.00995976, 0.00339537)
                                                                                                                                                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                                Node {
                                                                                                                                                    id: collision_Segment31
                                                                                                                                                    objectName: "COLLISION_Segment31"
                                                                                                                                                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                                                                                }
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                        Node {
                                                                                                                                            id: collision_Segment29
                                                                                                                                            objectName: "COLLISION_Segment29"
                                                                                                                                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                                Node {
                                                                                                                                    id: collision_Segment27
                                                                                                                                    objectName: "COLLISION_Segment27"
                                                                                                                                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                        Node {
                                                                                                                            id: collision_Segment25
                                                                                                                            objectName: "COLLISION_Segment25"
                                                                                                                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                                Node {
                                                                                                                    id: collision_Segment23
                                                                                                                    objectName: "COLLISION_Segment23"
                                                                                                                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                        Node {
                                                                                                            id: collision_Segment21
                                                                                                            objectName: "COLLISION_Segment21"
                                                                                                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                Node {
                                                                                                    id: collision_Segment19
                                                                                                    objectName: "COLLISION_Segment19"
                                                                                                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                        Node {
                                                                                            id: collision_Segment17
                                                                                            objectName: "COLLISION_Segment17"
                                                                                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                                        }
                                                                                    }
                                                                                }
                                                                                Node {
                                                                                    id: collision_Segment15
                                                                                    objectName: "COLLISION_Segment15"
                                                                                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                }
                                                                            }
                                                                            Node {
                                                                                id: body_Axis
                                                                                objectName: "Body_Axis"
                                                                                position: Qt.vector3d(0, 0.00349516, 0)
                                                                                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                            }
                                                                        }
                                                                        Node {
                                                                            id: collision_Segment13
                                                                            objectName: "COLLISION_Segment13"
                                                                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                        }
                                                                    }
                                                                }
                                                                Node {
                                                                    id: collision_Segment11
                                                                    objectName: "COLLISION_Segment11"
                                                                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                }
                                                            }
                                                        }
                                                        Node {
                                                            id: collision_Segment09
                                                            objectName: "COLLISION_Segment09"
                                                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                        }
                                                    }
                                                }
                                                Node {
                                                    id: collision_Segment07
                                                    objectName: "COLLISION_Segment07"
                                                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                }
                                            }
                                        }
                                        Node {
                                            id: collision_Segment05
                                            objectName: "COLLISION_Segment05"
                                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                            scale: Qt.vector3d(1, 1, 1)
                                        }
                                    }
                                }
                                Node {
                                    id: collision_Segment03
                                    objectName: "COLLISION_Segment03"
                                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                            }
                        }
                        Node {
                            id: collision_Segment01
                            objectName: "COLLISION_Segment01"
                            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                    Node {
                        id: jaw
                        objectName: "Jaw"
                        position: Qt.vector3d(0, 0.0573441, -0.00565895)
                        rotation: Qt.quaternion(0.0288102, 0.999585, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: jaw_Hinge
                        objectName: "Jaw_Hinge"
                        position: Qt.vector3d(0, 0.0573441, -0.00565895)
                        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: mouth_Anchor
                        objectName: "Mouth_Anchor"
                        position: Qt.vector3d(0, -0.0362173, 0)
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
            target: head
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.263783) }
            Keyframe { frame: 4000; value: Qt.vector3d(0, 0, 0.263783) }
        }
        KeyframeGroup {
            target: jaw
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/jaw_position_0.qad"
        }
        KeyframeGroup {
            target: jaw
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/jaw_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine32
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine32_position_0.qad"
        }
        KeyframeGroup {
            target: spine32
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine32_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine31
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine31_position_0.qad"
        }
        KeyframeGroup {
            target: spine31
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine31_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine30
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine30_position_0.qad"
        }
        KeyframeGroup {
            target: spine30
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine30_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine29
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine29_position_0.qad"
        }
        KeyframeGroup {
            target: spine29
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine29_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine28
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine28_position_0.qad"
        }
        KeyframeGroup {
            target: spine28
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine28_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine10
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine10_position_0.qad"
        }
        KeyframeGroup {
            target: spine10
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine10_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine09
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine09_position_0.qad"
        }
        KeyframeGroup {
            target: spine09
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine09_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine08
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine08_position_0.qad"
        }
        KeyframeGroup {
            target: spine08
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine08_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine27
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine27_position_0.qad"
        }
        KeyframeGroup {
            target: spine27
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine27_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine05
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine05_position_0.qad"
        }
        KeyframeGroup {
            target: spine05
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine05_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine04
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine04_position_0.qad"
        }
        KeyframeGroup {
            target: spine04
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine04_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine23
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine23_position_0.qad"
        }
        KeyframeGroup {
            target: spine23
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine23_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine03
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine03_position_0.qad"
        }
        KeyframeGroup {
            target: spine03
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine03_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine11
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine11_position_0.qad"
        }
        KeyframeGroup {
            target: spine11
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine11_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine02
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine02_position_0.qad"
        }
        KeyframeGroup {
            target: spine02
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine02_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine21
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine21_position_0.qad"
        }
        KeyframeGroup {
            target: spine21
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine21_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine01
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine01_position_0.qad"
        }
        KeyframeGroup {
            target: spine01
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine01_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine07
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine07_position_0.qad"
        }
        KeyframeGroup {
            target: spine07
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine07_rotation_0.qad"
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/head_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine17
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine17_position_0.qad"
        }
        KeyframeGroup {
            target: spine17
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine17_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine06
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine06_position_0.qad"
        }
        KeyframeGroup {
            target: spine06
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine06_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine25
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine25_position_0.qad"
        }
        KeyframeGroup {
            target: spine25
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine25_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine16
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine16_position_0.qad"
        }
        KeyframeGroup {
            target: spine16
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine16_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine12
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine12_position_0.qad"
        }
        KeyframeGroup {
            target: spine12
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine12_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine13
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine13_position_0.qad"
        }
        KeyframeGroup {
            target: spine13
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine13_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine14
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine14_position_0.qad"
        }
        KeyframeGroup {
            target: spine14
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine14_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine15
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine15_position_0.qad"
        }
        KeyframeGroup {
            target: spine15
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine15_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine18
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine18_position_0.qad"
        }
        KeyframeGroup {
            target: spine18
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine18_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine19
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine19_position_0.qad"
        }
        KeyframeGroup {
            target: spine19
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine19_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine20
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine20_position_0.qad"
        }
        KeyframeGroup {
            target: spine20
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine20_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine22
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine22_position_0.qad"
        }
        KeyframeGroup {
            target: spine22
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine22_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine24
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine24_position_0.qad"
        }
        KeyframeGroup {
            target: spine24
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine24_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine26
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine26_position_0.qad"
        }
        KeyframeGroup {
            target: spine26
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine26_rotation_0.qad"
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
            target: head
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.263783) }
            Keyframe { frame: 2000; value: Qt.vector3d(0, 0, 0.263783) }
        }
        KeyframeGroup {
            target: jaw
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/jaw_position_1.qad"
        }
        KeyframeGroup {
            target: jaw
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/jaw_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine32
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine32_position_1.qad"
        }
        KeyframeGroup {
            target: spine32
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine32_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine31
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine31_position_1.qad"
        }
        KeyframeGroup {
            target: spine31
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine31_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine30
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine30_position_1.qad"
        }
        KeyframeGroup {
            target: spine30
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine30_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine29
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine29_position_1.qad"
        }
        KeyframeGroup {
            target: spine29
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine29_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine28
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine28_position_1.qad"
        }
        KeyframeGroup {
            target: spine28
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine28_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine10
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine10_position_1.qad"
        }
        KeyframeGroup {
            target: spine10
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine10_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine09
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine09_position_1.qad"
        }
        KeyframeGroup {
            target: spine09
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine09_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine08
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine08_position_1.qad"
        }
        KeyframeGroup {
            target: spine08
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine08_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine27
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine27_position_1.qad"
        }
        KeyframeGroup {
            target: spine27
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine27_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine05
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine05_position_1.qad"
        }
        KeyframeGroup {
            target: spine05
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine05_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine04
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine04_position_1.qad"
        }
        KeyframeGroup {
            target: spine04
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine04_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine23
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine23_position_1.qad"
        }
        KeyframeGroup {
            target: spine23
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine23_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine03
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine03_position_1.qad"
        }
        KeyframeGroup {
            target: spine03
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine03_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine11
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine11_position_1.qad"
        }
        KeyframeGroup {
            target: spine11
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine11_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine02
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine02_position_1.qad"
        }
        KeyframeGroup {
            target: spine02
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine02_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine21
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine21_position_1.qad"
        }
        KeyframeGroup {
            target: spine21
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine21_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine01
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine01_position_1.qad"
        }
        KeyframeGroup {
            target: spine01
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine01_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine07
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine07_position_1.qad"
        }
        KeyframeGroup {
            target: spine07
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine07_rotation_1.qad"
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/head_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine17
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine17_position_1.qad"
        }
        KeyframeGroup {
            target: spine17
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine17_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine06
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine06_position_1.qad"
        }
        KeyframeGroup {
            target: spine06
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine06_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine25
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine25_position_1.qad"
        }
        KeyframeGroup {
            target: spine25
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine25_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine16
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine16_position_1.qad"
        }
        KeyframeGroup {
            target: spine16
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine16_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine12
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine12_position_1.qad"
        }
        KeyframeGroup {
            target: spine12
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine12_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine13
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine13_position_1.qad"
        }
        KeyframeGroup {
            target: spine13
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine13_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine14
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine14_position_1.qad"
        }
        KeyframeGroup {
            target: spine14
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine14_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine15
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine15_position_1.qad"
        }
        KeyframeGroup {
            target: spine15
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine15_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine18
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine18_position_1.qad"
        }
        KeyframeGroup {
            target: spine18
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine18_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine19
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine19_position_1.qad"
        }
        KeyframeGroup {
            target: spine19
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine19_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine20
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine20_position_1.qad"
        }
        KeyframeGroup {
            target: spine20
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine20_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine22
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine22_position_1.qad"
        }
        KeyframeGroup {
            target: spine22
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine22_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine24
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine24_position_1.qad"
        }
        KeyframeGroup {
            target: spine24
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine24_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine26
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine26_position_1.qad"
        }
        KeyframeGroup {
            target: spine26
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine26_rotation_1.qad"
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
            target: head
            property: "position"
            Keyframe { frame: 0; value: Qt.vector3d(0, 0, 0.263783) }
            Keyframe { frame: 1000; value: Qt.vector3d(0, 0, 0.263783) }
        }
        KeyframeGroup {
            target: jaw
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/jaw_position_2.qad"
        }
        KeyframeGroup {
            target: jaw
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/jaw_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine32
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine32_position_2.qad"
        }
        KeyframeGroup {
            target: spine32
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine32_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine31
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine31_position_2.qad"
        }
        KeyframeGroup {
            target: spine31
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine31_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine30
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine30_position_2.qad"
        }
        KeyframeGroup {
            target: spine30
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine30_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine29
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine29_position_2.qad"
        }
        KeyframeGroup {
            target: spine29
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine29_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine28
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine28_position_2.qad"
        }
        KeyframeGroup {
            target: spine28
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine28_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine10
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine10_position_2.qad"
        }
        KeyframeGroup {
            target: spine10
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine10_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine09
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine09_position_2.qad"
        }
        KeyframeGroup {
            target: spine09
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine09_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine08
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine08_position_2.qad"
        }
        KeyframeGroup {
            target: spine08
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine08_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine27
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine27_position_2.qad"
        }
        KeyframeGroup {
            target: spine27
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine27_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine05
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine05_position_2.qad"
        }
        KeyframeGroup {
            target: spine05
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine05_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine04
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine04_position_2.qad"
        }
        KeyframeGroup {
            target: spine04
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine04_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine23
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine23_position_2.qad"
        }
        KeyframeGroup {
            target: spine23
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine23_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine03
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine03_position_2.qad"
        }
        KeyframeGroup {
            target: spine03
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine03_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine11
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine11_position_2.qad"
        }
        KeyframeGroup {
            target: spine11
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine11_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine02
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine02_position_2.qad"
        }
        KeyframeGroup {
            target: spine02
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine02_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine21
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine21_position_2.qad"
        }
        KeyframeGroup {
            target: spine21
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine21_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine01
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine01_position_2.qad"
        }
        KeyframeGroup {
            target: spine01
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine01_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine07
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine07_position_2.qad"
        }
        KeyframeGroup {
            target: spine07
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine07_rotation_2.qad"
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/head_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine17
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine17_position_2.qad"
        }
        KeyframeGroup {
            target: spine17
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine17_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine06
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine06_position_2.qad"
        }
        KeyframeGroup {
            target: spine06
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine06_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine25
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine25_position_2.qad"
        }
        KeyframeGroup {
            target: spine25
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine25_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine16
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine16_position_2.qad"
        }
        KeyframeGroup {
            target: spine16
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine16_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine12
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine12_position_2.qad"
        }
        KeyframeGroup {
            target: spine12
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine12_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine13
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine13_position_2.qad"
        }
        KeyframeGroup {
            target: spine13
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine13_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine14
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine14_position_2.qad"
        }
        KeyframeGroup {
            target: spine14
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine14_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine15
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine15_position_2.qad"
        }
        KeyframeGroup {
            target: spine15
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine15_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine18
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine18_position_2.qad"
        }
        KeyframeGroup {
            target: spine18
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine18_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine19
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine19_position_2.qad"
        }
        KeyframeGroup {
            target: spine19
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine19_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine20
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine20_position_2.qad"
        }
        KeyframeGroup {
            target: spine20
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine20_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine22
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine22_position_2.qad"
        }
        KeyframeGroup {
            target: spine22
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine22_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine24
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine24_position_2.qad"
        }
        KeyframeGroup {
            target: spine24
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine24_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine26
            property: "position"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine26_position_2.qad"
        }
        KeyframeGroup {
            target: spine26
            property: "rotation"
            keyframeSource: "../../fish/zebra-moray-eel/animations/spine26_rotation_2.qad"
        }
    }
}
