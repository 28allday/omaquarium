import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

// Bar widget for the Omaquarium service. A tank glyph whose colour reflects
// state, and a click-driven dropdown (Panel.qml) anchored to it -- the same
// KeyboardPanel + BarIconButton mechanism the first-party audio widget uses.
//
// Every read and every mutation goes through the live service instance
// (bar.shell.serviceFor(pluginId)); if that is ever unreachable the widget
// falls back to the plugin's IPC target so the click still lands.
BarWidget {
  id: root
  moduleName: "nosignal.omaquarium"

  readonly property string pluginId: "nosignal.omaquarium"
  readonly property var service: (bar && bar.shell) ? bar.shell.serviceFor(pluginId) : null

  property bool opened: false
  // KeyboardPanel reads this back off its owner, and Bar.requestPopout prefers
  // closeForPopoutSwitch() over close(): without both, switching straight to
  // another bar popout races the closing animation for keyboard ownership.
  property bool popoutSwitchClosing: false

  function open() { opened = true }
  function close() { opened = false }
  function toggle() { opened = !opened }
  function closeForPopoutSwitch() {
    popoutSwitchClosing = true
    close()
    Qt.callLater(function() { root.popoutSwitchClosing = false })
  }

  readonly property bool isOn: !!service && service.tankOn === true
  readonly property bool isPaused: isOn && service.manualPaused === true
  readonly property color warningColor: "#e5c07b"
  readonly property color iconColor: !service ? Color.muted
                                   : isOn ? (isPaused ? warningColor : Color.accent)
                                   : Color.muted

  readonly property string glyph: "󰈺"  // nf-md-fish

  // ---- control helpers (direct service call, IPC fallback) -------------
  function toggleTank()   { if (service) service.applyToggle(); else ipc("toggle") }
  function turnOn()       { if (service) service.applyOn(); else ipc("on") }
  function turnOff()      { if (service) service.applyOff(); else ipc("off") }
  function togglePause() {
    if (!service) { ipc("pause"); return }
    if (!service.tankOn) { service.applyOn(); return }
    if (service.manualPaused) service.applyResume(); else service.applyPause()
  }
  function shuffle()      { if (service) service.applyShuffle(); else ipc("shuffle") }
  function set(key, value) {
    if (service) { service.applySet(key, value); return }
    var m = { lighting: "setLighting", speed: "setSpeed", fish: "setFish", size: "setSize", bubbles: "setBubbles", particles: "setParticles",
              quality: "setQuality", backend: "setBackend", bitMode: "setBitMode", pauseOnFullscreen: "setPauseOnFullscreen" }
    if (m[key]) ipc(m[key], String(value))
  }

  // Fallback path only: the shell's own IPC wrapper, never a hardcoded qs path.
  function ipc(fn) {
    var cmd = ["omarchy-shell", "omaquarium", fn]
    for (var i = 1; i < arguments.length; i++) {
      var a = arguments[i]
      cmd.push(a === undefined || a === null ? "" : String(a))
    }
    Quickshell.execDetached(cmd)
  }

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.glyph
    tooltipText: "Omaquarium"
    useActiveColor: false
    foreground: root.iconColor
    onPressed: function(b) {
      if (b === Qt.RightButton) root.toggleTank()
      else root.toggle()
    }
  }

  KeyboardPanel {
    id: kpanel
    anchorItem: button
    owner: root
    bar: root.bar
    open: root.opened
    focusTarget: keyCatcher
    contentWidth: kpanel.fittedContentWidth(Style.space(320))
    contentHeight: kpanel.fittedContentHeight(contentLoader.item ? contentLoader.item.implicitHeight : Style.space(200))

    PanelKeyCatcher {
      id: keyCatcher
      anchors.fill: parent
      blocked: contentLoader.item ? contentLoader.item.keysBlocked : false
      onCloseRequested: root.close()

      Loader {
        id: contentLoader
        anchors.fill: parent
        source: "Panel.qml"
        onLoaded: {
          if (!item) return
          item.widget = root
          item.bar = root.bar
        }
      }
    }
  }
}
