pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

ShellRoot {
    id: renderer
    property var applied: ({paused: false, fish: 20, size: 1, speed: 1,
        quality: "high", lighting: "daylight", bubbles: true, particles: true,
        bitMode: false, bitPalette: ["#172f24", "#3d6240", "#819c48", "#c2d178"], seed: 0, fullscreen: {}})
    property var tanks: ({})
    function report() {
        var result = {}
        for (var name in tanks) result[name] = tanks[name].report()
        return {ready: Object.keys(result).length > 0, screens: result}
    }
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: panel
            required property var modelData
            screen: modelData
            color: renderer.applied.bitMode ? renderer.applied.bitPalette[0] : "#091c2c"
            anchors {top: true; bottom: true; left: true; right: true}
            exclusionMode: ExclusionMode.Ignore
            WlrLayershell.namespace: "omarchy-omaquarium-background"
            WlrLayershell.layer: WlrLayer.Background
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
            mask: Region {}
            // A QML-owned capture surface includes the whole composition;
            // the native Quickshell content item itself cannot be grabbed.
            Item {
                anchors.fill: parent
            TankScene {
                id: tank
                running: !renderer.applied.paused && !renderer.applied.fullscreen[panel.modelData.name]
                fishCount: renderer.applied.fish
                fishSize: renderer.applied.size
                speed: renderer.applied.speed
                renderScale: renderer.applied.quality === "low" ? .5 : renderer.applied.quality === "medium" ? .75 : 1
                fps: renderer.applied.quality === "low" ? 24 : renderer.applied.quality === "medium" ? 30 : 60
                lighting: renderer.applied.lighting
                bubblesEnabled: renderer.applied.bubbles
                motesEnabled: renderer.applied.particles
                bitMode: renderer.applied.bitMode
                bitPalette: renderer.applied.bitPalette
                seedToken: renderer.applied.seed
                Component.onCompleted: {
                    var next = Object.assign({}, renderer.tanks)
                    next[panel.modelData.name] = tank
                    renderer.tanks = next
                }
                Component.onDestruction: {
                    var next = Object.assign({}, renderer.tanks)
                    delete next[panel.modelData.name]
                    renderer.tanks = next
                }
            }
            }
        }
    }
    IpcHandler {
        target: "aquarium"
        function configure(payload: string): string {
            if (payload.length > 16384) return "oversized settings"
            var value = JSON.parse(payload)
            if (!value || typeof value !== "object" || Array.isArray(value)) return "invalid settings"
            function number(v, lo, hi, fallback) { return isFinite(Number(v)) ? Math.max(lo, Math.min(hi, Number(v))) : fallback }
            var palette = value.bitPalette
            if (!Array.isArray(palette) || palette.length !== 4 ||
                    !palette.every(function(c) { return typeof c === "string" && /^#[0-9a-fA-F]{6}$/.test(c) }))
                palette = renderer.applied.bitPalette
            renderer.applied = {
                paused: value.paused === true, fish: Math.round(number(value.fish, 4, 24, 20)),
                size: number(value.size, .5, 1.6, 1), speed: number(value.speed, .25, 3, 1),
                quality: ["low", "medium", "high"].indexOf(value.quality) >= 0 ? value.quality : "high",
                lighting: ["daylight", "dusk", "moonlight"].indexOf(value.lighting) >= 0 ? value.lighting : "daylight",
                bubbles: value.bubbles !== false, particles: value.particles !== false,
                bitMode: value.bitMode === true,
                bitPalette: palette,
                seed: number(value.seed, 0, 2147483647, 0),
                fullscreen: value.fullscreen && typeof value.fullscreen === "object" ? value.fullscreen : {}
            }
            return JSON.stringify(renderer.report())
        }
        function status(): string { return JSON.stringify(renderer.report()) }
        function capture(screen: string, path: string): void {
            if (renderer.tanks[screen]) renderer.tanks[screen].capture(path)
        }
        function quit(): void { Qt.quit() }
    }
}
