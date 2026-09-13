import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import qs.Commons

// Persistent controls stay in the host. The current reef runs in an owned
// renderer process, allowing aquarium-only Vulkan without restarting the shell.
Item {
  id: root

  // ---- injected by shell.qml (_syncServices/ensureService) ----
  property string omarchyPath: Quickshell.env("OMARCHY_PATH")
  property var shell: null
  property var manifest: null
  property var pluginRegistry: null

  readonly property string pluginId: "nosignal.omaquarium"
  readonly property string home: Quickshell.env("HOME")
  readonly property string stateDir: (Quickshell.env("XDG_STATE_HOME") || (home + "/.local/state")) + "/omaquarium"
  readonly property string statePath: stateDir + "/state.json"

  // ---------------------------------------------------------------- config
  readonly property var pluginConfig: {
    var cfg = shell && shell.shellConfig ? shell.shellConfig : null
    if (!cfg || !Array.isArray(cfg.plugins)) return ({})
    for (var i = 0; i < cfg.plugins.length; i++) {
      var e = cfg.plugins[i]
      if (e && String(e.id).replace(/^@/, "") === pluginId) return e
    }
    return ({})
  }

  function cfg(name, fallback) {
    var v = pluginConfig ? pluginConfig[name] : undefined
    return (v === undefined || v === null) ? fallback : v
  }

  // ------------------------------------------------------------- bounds
  // state.json is user-writable and the shell that reads it never exits, so
  // everything taken from it (or from the config entry, or from IPC) is
  // clamped before it is kept. The values here are all small scalars and a
  // lighting name, so the clamps are ranges and a length cap.
  readonly property int maxStateBytes: 65536
  readonly property int maxNameLength: 64
  readonly property int helperSeconds: 5
  readonly property var timeoutPrefix: ["timeout", "-k", "1", String(root.helperSeconds)]

  function clampNum(v, lo, hi, fallback) {
    var n = Number(v)
    if (!isFinite(n)) return fallback
    return Math.max(lo, Math.min(hi, n))
  }

  function asBool(v, fallback) {
    if (v === true || v === false) return v
    var s = String(v === undefined || v === null ? "" : v).trim().toLowerCase()
    if (s === "true" || s === "on" || s === "1" || s === "yes") return true
    if (s === "false" || s === "off" || s === "0" || s === "no") return false
    return fallback
  }

  // Backend names are normalised the same way as the other names, so a
  // capitalised value from the config or the CLI is accepted rather than
  // silently dropped.
  readonly property var backendNames: ["auto", "vulkan", "opengl"]
  function safeBackend(v, fallback) {
    var s = String(v === undefined || v === null ? "" : v)
    if (s.length > root.maxNameLength) return fallback
    s = s.trim().toLowerCase()
    return root.backendNames.indexOf(s) !== -1 ? s : fallback
  }

  // The plugin's version is the manifest's version. The host injects the
  // manifest; the length cap keeps an edited file from growing the status.
  readonly property string version: {
    var v = root.manifest ? root.manifest.version : ""
    v = String(v === undefined || v === null ? "" : v)
    return v.length > root.maxNameLength ? v.substring(0, root.maxNameLength) : v
  }

  // Lighting modes preserve natural fish colours.
  readonly property var lightingNames: ["daylight", "dusk", "moonlight"]
  function safeLighting(v, fallback) {
    var s = String(v === undefined || v === null ? "" : v)
    if (s.length > root.maxNameLength) return fallback      // length first, before any work on it
    s = s.trim().toLowerCase()
    return s !== "" && root.lightingNames.indexOf(s) !== -1 ? s : fallback
  }
  function safeQuality(v, fallback) {
    var s = String(v === undefined || v === null ? "" : v)
    if (s.length > root.maxNameLength) return fallback
    s = s.trim().toLowerCase()
    return Object.prototype.hasOwnProperty.call(root.qualityLevels, s) ? s : fallback
  }

  // ------------------------------------------------------------- quality
  // One knob for "how much GPU": the shader's render scale and the tick rate.
  readonly property var qualityLevels: ({
    low:    { scale: 0.5, fps: 24 },
    medium: { scale: 0.75,  fps: 30 },
    high:   { scale: 1.0,  fps: 60 }
  })

  // ---------------------------------------------------------------- state
  property bool tankOn: false
  property string lighting: "daylight"
  property real speed: 1.0
  property int fishCount: 20
  property real fishSize: 1.0
  property string quality: "high"
  property string backend: "vulkan"
  property int loadedSceneVersion: 0
  property bool pauseOnFullscreen: true
  property bool bubbles: true
  property bool particles: true
  property bool bitMode: false
  // Follow the shell's live Color singleton, including runtime theme changes.
  // Sort endpoints by luminance so light themes retain readable dark outlines.
  readonly property var bitPalette: {
    function luminance(c) { return c.r * .299 + c.g * .587 + c.b * .114 }
    function mix(a, b, t) { return Qt.rgba(a.r+(b.r-a.r)*t, a.g+(b.g-a.g)*t, a.b+(b.b-a.b)*t, 1) }
    var a = Color.background, b = Color.foreground, accent = Color.accent
    var dark = luminance(a) < luminance(b) ? a : b
    var light = luminance(a) < luminance(b) ? b : a
    return [String(mix(dark,dark,0)), String(mix(mix(dark,light,1/3),accent,.30)),
            String(mix(mix(dark,light,2/3),accent,.22)), String(mix(light,light,0))]
  }

  // Not persisted: a manual pause and the shuffle token (each Tank reseeds
  // when it ticks over).
  property bool manualPaused: false
  property int seedToken: 0
  property var populations: ({})

  property bool _stateLoaded: false

  readonly property bool rendering: root.tankOn && root._stateLoaded

  function statusObject() {
    return {
      enabled: root.tankOn,
      paused: root.manualPaused,
      lighting: root.lighting,
      speed: root.speed,
      fish: root.fishCount,
      size: root.fishSize,
      quality: root.quality,
      bubbles: root.bubbles,
      particles: root.particles,
      bitMode: root.bitMode,
      pauseOnFullscreen: root.pauseOnFullscreen,
      screens: Quickshell.screens.length,
      populations: root.populations,
      frozen: Object.keys(root.fullscreenMonitors || ({})),
      version: root.version, backend: root.backend, bitPalette: root.bitPalette,
      rendererRunning: rendererProc.running, renderer: root.rendererStatus
    }
  }

  // ------------------------------------------------------- persistence
  function persistState() {
    var payload = JSON.stringify({
      sceneVersion: 1,
      backend: root.backend,
      bitMode: root.bitMode,
      enabled: root.tankOn,
      lighting: root.lighting,
      speed: root.speed,
      fish: root.fishCount,
      size: root.fishSize,
      quality: root.quality,
      bubbles: root.bubbles,
      particles: root.particles,
      pauseOnFullscreen: root.pauseOnFullscreen
    }, null, 2) + "\n"
    root.writeState(payload)
  }

  // Apply a settings object (from the state file, the config seed, or IPC),
  // every field optional and clamped.
  function applySettings(o) {
    if (!o || typeof o !== "object") return
    if (o.backend !== undefined) root.backend = safeBackend(o.backend, root.backend)
    if (o.particles !== undefined) root.particles = asBool(o.particles, root.particles)
    if (o.bitMode !== undefined) root.bitMode = asBool(o.bitMode, root.bitMode)
    if (o.bubbles !== undefined) root.bubbles = asBool(o.bubbles, root.bubbles)
    if (o.enabled !== undefined) root.tankOn = asBool(o.enabled, root.tankOn)
    if (o.lighting !== undefined) root.lighting = safeLighting(o.lighting, root.lighting)
    if (o.speed !== undefined) root.speed = clampNum(o.speed, 0.25, 3.0, root.speed)
    if (o.fish !== undefined) root.fishCount = Math.round(clampNum(o.fish, 4, 24, root.fishCount))
    if (o.size !== undefined) root.fishSize = clampNum(o.size, 0.5, 1.6, root.fishSize)
    if (o.quality !== undefined) root.quality = safeQuality(o.quality, root.quality)
    if (o.pauseOnFullscreen !== undefined) root.pauseOnFullscreen = asBool(o.pauseOnFullscreen, root.pauseOnFullscreen)
  }

  function applyStateText(txt) {
    var t = String(txt || "").trim()
    if (!t) return false
    // Refuse an oversized file rather than handing it to JSON.parse.
    if (t.length > root.maxStateBytes) {
      console.warn("omaquarium: state.json is", t.length, "bytes, over the", root.maxStateBytes, "limit - ignoring it")
      return false
    }
    try {
      var o = JSON.parse(t)
      if (!o || typeof o !== "object" || Array.isArray(o)) return false
      root.applySettings(o)
      root.loadedSceneVersion = Math.round(clampNum(o.sceneVersion, 0, 1, 0))
      return true
    } catch (e) {
      console.warn("omaquarium: state.json unreadable:", e)
      return false
    }
  }

  // The config entry seeds a fresh install; once a state file exists it wins.
  function seedFromConfig() {
    root.applySettings({
      enabled: cfg("enabled", undefined),
      lighting: cfg("lighting", undefined),
      speed: cfg("speed", undefined),
      fish: cfg("fish", undefined),
      size: cfg("size", undefined),
      quality: cfg("quality", undefined),
      bubbles: cfg("bubbles", undefined),
      particles: cfg("particles", undefined),
      bitMode: cfg("bitMode", undefined),
      pauseOnFullscreen: cfg("pauseOnFullscreen", undefined),
      backend: cfg("backend", undefined)
    })
  }

  // state.json is read through `head -c` with a deadline, never a FileView:
  // a FileView loads the whole file before any handler runs, and a FIFO at
  // the path would block an unguarded open for the life of the session.
  Process {
    id: stateReadProc
    command: root.timeoutPrefix.concat(
      ["bash", "-c",
       'if [ -L "$2" ] || [ ! -f "$2" ]; then exit 0; fi; ' +
       'head -c "$1" -- "$2" 2>/dev/null || true',
       "_", String(root.maxStateBytes + 1), root.statePath])
    stdout: StdioCollector {
      onStreamFinished: {
        stateReadFallback.stop()
        root.finishStateLoad(text)
      }
    }
    onExited: stateReadFallback.restart()
  }

  Timer {
    id: stateReadFallback
    interval: 250
    onTriggered: root.finishStateLoad("")
  }

  function finishStateLoad(txt) {
    if (root._stateLoaded) return
    var had = root.applyStateText(txt)
    if (!had) root.seedFromConfig()
    // The old procedural scene's count/scale/speed do not describe this reef.
    // Adopt the accepted preview once; later updates keep all saved controls.
    if (had && root.loadedSceneVersion < 1) {
      root.fishCount = 20; root.fishSize = 1; root.speed = 1
      root.quality = "high"; root.lighting = "daylight"
    }
    root._stateLoaded = true
    if (had && root.loadedSceneVersion < 1) root.persistState()
  }

  // Atomic write: temp file in the same directory, then rename over the
  // target. The payload is a positional parameter, never interpolated.
  Process {
    id: stateWriteProc
    onExited: if (root._pendingState !== "") { var q = root._pendingState; root._pendingState = ""; root.writeState(q) }
  }

  property string _pendingState: ""

  function writeState(payload) {
    if (stateWriteProc.running) { root._pendingState = payload; return }
    stateWriteProc.command = root.timeoutPrefix.concat(["bash", "-c",
      'd=$(dirname -- "$1"); mkdir -p -- "$d" || exit 1; ' +
      'if [ -L "$1" ]; then rm -f -- "$1"; fi; ' +
      't=$(mktemp -- "$1.XXXXXX") || exit 1; ' +
      'printf %s "$2" > "$t" && mv -f -- "$t" "$1" || { rm -f -- "$t"; exit 1; }',
      "_", root.statePath, payload])
    stateWriteProc.running = true
  }

  Process {
    id: mkStateDir
    command: root.timeoutPrefix.concat(["mkdir", "-p", root.stateDir])
    onExited: stateReadProc.running = true
  }

  Component.onCompleted: mkStateDir.running = true

  // ------------------------------------------------------- fullscreen watch
  // Hyprland's event stream says WHEN to re-check; hyprctl gives per-monitor
  // ground truth (whose visible workspace has a fullscreen window). The tank
  // on that monitor freezes -- it is covered anyway, so ticking it is waste.
  //
  // The compositor is a producer outside this plugin, so its output is
  // bounded at three boundaries, not one -- `timeout` limits how LONG the
  // helper runs, never how MUCH it reads or emits:
  //   1. the helper stream-reads each hyprctl query up to a hard byte ceiling
  //      and treats an over-size reply as no reply;
  //   2. it caps the monitor and workspace counts it parses and truncates
  //      every name, and emits at most maxFsMonitors lines;
  //   3. `head -c` sits on the pipe in front of the StdioCollector, so the
  //      shell process can never receive more than fsStdoutBytes whatever the
  //      helper does -- and the QML handler caps what it RETAINS independently.
  // On any failure the helper prints nothing, which reads as "no fullscreen
  // monitor": the tank keeps running rather than freezing on bad data.
  property var fullscreenMonitors: ({})
  readonly property int maxFsMonitors: 64        // far above any real monitor count
  readonly property int fsQueryBytes: 262144     // per hyprctl reply, read with a ceiling
  readonly property int fsStdoutBytes: 8192      // helper stdout, capped on the pipe

  readonly property string fsScript:
    "import json,subprocess,sys\n" +
    "CAP=" + root.fsQueryBytes + "; MAXM=" + root.maxFsMonitors + "; MAXW=1024; MAXN=" + root.maxNameLength + "\n" +
    "def q(c):\n" +
    "    p=subprocess.Popen(['hyprctl','-j',c],stdout=subprocess.PIPE,stderr=subprocess.DEVNULL)\n" +
    "    try:\n" +
    "        data=p.stdout.read(CAP+1)\n" +
    "    finally:\n" +
    "        try: p.stdout.close()\n" +
    "        except Exception: pass\n" +
    "        try: p.kill()\n" +
    "        except Exception: pass\n" +
    "        p.wait()\n" +
    "    if len(data)>CAP: raise ValueError('reply over ceiling')\n" +
    "    v=json.loads(data)\n" +
    "    if not isinstance(v,list): raise ValueError('not a list')\n" +
    "    return v\n" +
    "try:\n" +
    "    mons=q('monitors')[:MAXM]; wss=q('workspaces')[:MAXW]\n" +
    "    fs={}\n" +
    "    for w in wss:\n" +
    "        if isinstance(w,dict): fs[w.get('id')]=bool(w.get('hasfullscreen'))\n" +
    "    out=[]\n" +
    "    for m in mons:\n" +
    "        if not isinstance(m,dict): continue\n" +
    "        aw=m.get('activeWorkspace') or {}\n" +
    "        sw=m.get('specialWorkspace') or {}\n" +
    "        if (isinstance(aw,dict) and fs.get(aw.get('id'))) or (isinstance(sw,dict) and fs.get(sw.get('id'))):\n" +
    "            n=str(m.get('name',''))[:MAXN]\n" +
    "            if n: out.append(n)\n" +
    "    sys.stdout.write('\\n'.join(out[:MAXM]))\n" +
    "except Exception:\n" +
    "    pass\n"

  // Hyprland can emit a storm of events (a window flood, a workspace
  // animation); every one of them only *restarts the debounce*, and a probe
  // cannot run again within fsMinIntervalMs of the last one, so the
  // compositor can never drive more than ~2 helper spawns a second however
  // busy it is. Work bounded by the clock, not by the producer.
  readonly property int fsMinIntervalMs: 500
  property double _fsLastRun: 0

  function refreshFullscreen() {
    if (!root.pauseOnFullscreen || !root.tankOn) return
    if (fsProc.running) { fsDebounce.restart(); return }
    var now = Date.now()
    if (now - root._fsLastRun < root.fsMinIntervalMs) { fsDebounce.restart(); return }
    root._fsLastRun = now
    fsProc.running = true
  }

  Process {
    id: fsProc
    // The script crosses as argv ($1), never interpolated; head -c on the
    // pipe bounds what the collector can ever be handed.
    command: root.timeoutPrefix.concat(["bash", "-c",
      'python3 -c "$1" 2>/dev/null | head -c "$2"',
      "_", root.fsScript, String(root.fsStdoutBytes)])
    stdout: StdioCollector {
      onStreamFinished: {
        // Cap what is RETAINED independently of what arrived.
        var set = ({})
        var lines = String(text || "").split("\n")
        var kept = 0
        for (var i = 0; i < lines.length && kept < root.maxFsMonitors; i++) {
          var n = lines[i].trim()
          if (n === "") continue
          if (n.length > root.maxNameLength) n = n.substring(0, root.maxNameLength)
          if (!set[n]) { set[n] = true; kept++ }
        }
        root.fullscreenMonitors = set
      }
    }
  }

  Timer {
    id: fsDebounce
    interval: 250
    repeat: false
    onTriggered: root.refreshFullscreen()
  }

  Connections {
    target: Hyprland
    function onRawEvent(event) {
      switch (event.name) {
        case "fullscreen":
        case "fullscreenv2":
        case "activewindow":
        case "activewindowv2":
        case "openwindow":
        case "closewindow":
        case "movewindowv2":
        case "changefloatingmode":
        case "workspace":
        case "workspacev2":
        case "focusedmon":
        case "focusedmonv2":
        case "activespecial":
        case "activespecialv2":
        case "monitoradded":
        case "monitorremoved":
          fsDebounce.restart()
          break
      }
    }
  }

  Timer { interval: 400; running: true; repeat: false; onTriggered: root.refreshFullscreen() }
  onTankOnChanged: if (tankOn) fsDebounce.restart()
  onPauseOnFullscreenChanged: if (pauseOnFullscreen) fsDebounce.restart(); else fullscreenMonitors = ({})

  // ------------------------------------------------------ owned renderer
  property string rendererPath: (Quickshell.env("XDG_CONFIG_HOME") || (home + "/.config"))
                                + "/omarchy/plugins/" + pluginId + "/aquarium/shell.qml"
  property var rendererStatus: ({})
  readonly property string controlPayload: JSON.stringify({
    paused: root.manualPaused, fish: root.fishCount, size: root.fishSize,
    speed: root.speed, quality: root.quality, lighting: root.lighting,
    bubbles: root.bubbles, particles: root.particles, seed: root.seedToken,
    bitMode: root.bitMode, bitPalette: root.bitPalette,
    fullscreen: root.pauseOnFullscreen ? root.fullscreenMonitors : ({})
  })
  onControlPayloadChanged: controlDebounce.restart()
  onBackendChanged: {
    if (rendererProc.running) rendererProc.running = false
    rendererRestart.restart()
  }
  onRenderingChanged: {
    rendererProc.running = root.rendering
    if (!root.rendering) { root.rendererStatus = ({}); root.populations = ({}) }
  }
  Timer {
    id: rendererRestart
    interval: 500
    onTriggered: if (root.rendering) rendererProc.running = true
  }
  Process {
    id: rendererProc
    command: (root.backend === "auto" ? [] : ["env", "QSG_RHI_BACKEND=" + root.backend]).concat(
      ["quickshell", "-n", "-p", root.rendererPath])
    onStarted: controlDebounce.restart()
    onExited: { root.rendererStatus = ({}); root.populations = ({}) }
    stdout: SplitParser { onRead: data => console.log("omaquarium renderer:", data.slice(0, 2048)) }
    stderr: SplitParser { onRead: data => console.log("omaquarium renderer:", data.slice(0, 2048)) }
  }
  Timer {
    id: controlDebounce
    interval: 200
    onTriggered: root.sendControls()
  }
  // Refresh actual renderer readiness/GPU/population after startup and reloads.
  Timer { interval: 2000; repeat: true; running: root.rendering; onTriggered: root.sendControls() }
  function sendControls() {
    if (!rendererProc.running) return
    if (controlProc.running) { controlDebounce.restart(); return }
    controlProc.command = root.timeoutPrefix.concat(["quickshell", "ipc", "-p", root.rendererPath,
      "call", "aquarium", "configure", root.controlPayload])
    controlProc.running = true
  }
  Process {
    id: controlProc
    stdout: StdioCollector {
      onStreamFinished: {
        if (!root.rendering || text.length > root.maxStateBytes) return
        try {
          var result = JSON.parse(text)
          root.rendererStatus = result
          var next = ({})
          for (var name in result.screens) {
            var scene = result.screens[name]
            next[name] = {fish: scene.fish, species: scene.species, residents: ["cave-moray", "giant-clam"]}
          }
          root.populations = next
        } catch (e) { /* startup may precede the renderer's IPC socket */ }
      }
    }
  }

  // ------------------------------------------------------------ mutators
  // Root-level mutators are the single source of truth; the IpcHandler and
  // the bar widget both call them.
  function applyOn()      { root.tankOn = true; root.manualPaused = false; if (root.rendering) rendererProc.running = true; root.persistState(); return root.statusObject() }
  function applyOff()     { root.populations = ({}); root.tankOn = false; root.manualPaused = false; root.persistState(); return root.statusObject() }
  function applyToggle()  { return root.tankOn ? root.applyOff() : root.applyOn() }
  function applyPause()   { root.manualPaused = true; return root.statusObject() }
  function applyResume()  { root.manualPaused = false; return root.statusObject() }
  function applyShuffle() { root.seedToken++; return root.statusObject() }

  function applySet(key, value) {
    var o = ({}); o[key] = value
    root.applySettings(o)
    root.persistState()
    return root.statusObject()
  }

  IpcHandler {
    target: "omaquarium"

    function on(): string      { return JSON.stringify(root.applyOn()) }
    function off(): string     { return JSON.stringify(root.applyOff()) }
    function toggle(): string  { return root.applyToggle().enabled ? "on" : "off" }
    function pause(): string   { root.applyPause(); return "paused" }
    function resume(): string  { root.applyResume(); return "running" }
    function shuffle(): string { root.applyShuffle(); return "shuffled" }
    function status(): string  { return JSON.stringify(root.statusObject()) }
    function lights(): string { return root.lightingNames.join("\n") }

    function setBackend(name: string): string { return JSON.stringify(root.applySet("backend", name)) }
    function setBitMode(on: string): string { return JSON.stringify(root.applySet("bitMode", on)) }
    // Lighting: daylight|dusk|moonlight
    function setLighting(name: string): string { return JSON.stringify(root.applySet("lighting", name)) }
    // setSpeed 0.25..3
    function setSpeed(x: string): string      { return JSON.stringify(root.applySet("speed", x)) }
    // setFish 4..24
    function setFish(n: string): string      { return JSON.stringify(root.applySet("fish", n)) }
    // setSize 0.5..1.6
    function setSize(x: string): string       { return JSON.stringify(root.applySet("size", x)) }
    // setQuality low|medium|high
    function setQuality(q: string): string    { return JSON.stringify(root.applySet("quality", q)) }
    function setParticles(on: string): string { return JSON.stringify(root.applySet("particles", on)) }
    function setBubbles(on: string): string { return JSON.stringify(root.applySet("bubbles", on)) }
    function setPauseOnFullscreen(on: string): string { return JSON.stringify(root.applySet("pauseOnFullscreen", on)) }
  }
}
