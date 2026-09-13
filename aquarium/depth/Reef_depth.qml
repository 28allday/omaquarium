import QtQuick
import QtQuick3D

Node {
    id: node

    // Resources
    PrincipledMaterial {
        id: principledMaterial
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: reef_depth
        objectName: "Reef_depth"
        source: "meshes/reef_depth_mesh.mesh"
        materials: [
            principledMaterial,
            principledMaterial
        ]
    }

    // Animations:
}
