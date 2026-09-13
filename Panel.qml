import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

// Dropdown content for the Omaquarium bar widget. Loaded by string URL into
// BarWidget.qml's KeyboardPanel, so this is plain content: open/close, IPC and
// popout coordination all live in the widget. Reads and mutations go through
// `widget`, which owns the service handle.
Item {
  id: panel

  property var widget: null
  property QtObject bar: null

  readonly property var service: widget ? widget.service : null
  readonly property bool keysBlocked: lightingDropdown.popupOpen || qualityDropdown.popupOpen || backendDropdown.popupOpen

  readonly property color fg: bar ? bar.foreground : Color.foreground
  readonly property string fontFamily: bar ? bar.fontFamily : Style.font.family
  readonly property color dim: Qt.darker(fg, 1.5)

  readonly property bool isOn: !!service && service.tankOn === true
  readonly property bool isPaused: isOn && service.manualPaused === true
  readonly property string stateText: !service ? "Service unavailable"
                                     : !isOn ? "Off"
                                     : !service.rendererRunning ? "Renderer stopped"
                                     : isPaused ? "Paused" : "Running"
  readonly property string metaText: {
    if (!service) return stateText
    var n = String(service.lighting || "daylight")
    return stateText + "  ·  " + n.charAt(0).toUpperCase() + n.slice(1)
  }

  readonly property var lightingOptions: [
    { value: "daylight", label: "Daylight · clear tropical water" },
    { value: "dusk", label: "Dusk · warm evening light" },
    { value: "moonlight", label: "Moonlight · deep blue calm" }
  ]
  readonly property var qualityOptions: [
    { value: "low",    label: "Low · half res, 24 fps" },
    { value: "medium", label: "Medium · ¾ res, 30 fps" },
    { value: "high",   label: "High · full res, 60 fps" }
  ]

  implicitWidth: Style.space(320)
  implicitHeight: col.implicitHeight

  Column {
    id: col
    width: parent.width
    spacing: Style.spacing.panelGap

    PanelHero {
      width: parent.width
      title: "Omaquarium"
      meta: panel.metaText
      foreground: panel.fg
      fontFamily: panel.fontFamily
      iconComponent: Component {
        Text {
          textFormat: Text.PlainText
          text: "󰈺"
          color: panel.widget ? panel.widget.iconColor : panel.fg
          font.family: panel.fontFamily
          font.pixelSize: Style.font.display
        }
      }
    }

    // ---------- transport ----------
    Row {
      width: parent.width
      spacing: Style.spacing.controlGap

      Button {
        foreground: panel.fg
        fontFamily: panel.fontFamily
        iconText: "󰐥"
        text: panel.isOn ? "Turn off" : "Turn on"
        bordered: true
        onClicked: if (panel.widget) panel.widget.toggleTank()
      }

      Button {
        foreground: panel.fg
        fontFamily: panel.fontFamily
        iconText: panel.isPaused ? "󰐊" : "󰏤"
        text: panel.isPaused ? "Resume" : "Pause"
        bordered: true
        opacity: panel.isOn ? 1.0 : 0.5
        enabled: panel.isOn
        onClicked: if (panel.widget) panel.widget.togglePause()
      }

      Button {
        foreground: panel.fg
        fontFamily: panel.fontFamily
        iconText: "󰒝"
        text: "Shuffle"
        tooltipText: "Give the fish fresh starting positions and swimming routes"
        bordered: true
        opacity: panel.isOn ? 1.0 : 0.5
        enabled: panel.isOn
        onClicked: if (panel.widget) panel.widget.shuffle()
      }
    }

    Toggle {
      width: parent.width
      label: "Bit mode · Game Boy"
      description: "Rich pixel artwork using your system theme"
      foreground: panel.fg
      checked: panel.service ? panel.service.bitMode === true : false
      onClicked: if (panel.widget) panel.widget.set("bitMode", !checked)
    }

    // ---------- lighting ----------
    Dropdown {
      id: lightingDropdown
      width: parent.width
      label: "LIGHTING"
      options: panel.lightingOptions
      value: panel.service ? String(panel.service.lighting) : "daylight"
      onChanged: function(v) { if (panel.widget) panel.widget.set("lighting", String(v)) }
    }

    // ---------- sliders ----------
    PanelSectionHeader { text: "SPEED"; foreground: panel.fg; fontFamily: panel.fontFamily }
    PanelSlider {
      width: parent.width
      bar: panel.bar
      minimum: 0.25; maximum: 3.0; step: 0.05
      value: panel.service ? panel.service.speed : 1.0
      onReleased: function(v) { if (panel.widget) panel.widget.set("speed", v) }
    }

    PanelSectionHeader {
      text: "FISH · " + (panel.service ? panel.service.fishCount : 20)
      foreground: panel.fg; fontFamily: panel.fontFamily
    }
    PanelSlider {
      width: parent.width
      bar: panel.bar
      minimum: 4; maximum: 24; step: 1; integer: true
      tickCount: 11
      value: panel.service ? panel.service.fishCount : 20
      onReleased: function(v) { if (panel.widget) panel.widget.set("fish", Math.round(v)) }
    }

    PanelSectionHeader { text: "FISH SIZE"; foreground: panel.fg; fontFamily: panel.fontFamily }
    PanelSlider {
      width: parent.width
      bar: panel.bar
      minimum: 0.5; maximum: 1.6; step: 0.05
      value: panel.service ? panel.service.fishSize : 1.0
      onReleased: function(v) { if (panel.widget) panel.widget.set("size", v) }
    }

    // ---------- quality ----------
    Dropdown {
      id: qualityDropdown
      width: parent.width
      label: "QUALITY"
      options: panel.qualityOptions
      value: panel.service ? String(panel.service.quality) : "high"
      onChanged: function(v) { if (panel.widget) panel.widget.set("quality", String(v)) }
    }

    Dropdown {
      id: backendDropdown
      width: parent.width
      label: "GRAPHICS"
      options: [
        {value: "vulkan", label: "Vulkan"},
        {value: "opengl", label: "OpenGL · compatibility"},
        {value: "auto", label: "System default"}
      ]
      value: panel.service ? String(panel.service.backend) : "vulkan"
      onChanged: function(v) { if (panel.widget) panel.widget.set("backend", String(v)) }
    }

    Toggle {
      width: parent.width
      label: "Bubbles"
      description: "Random bursts from the tiki ornament"
      foreground: panel.fg
      checked: panel.service ? panel.service.bubbles === true : true
      onClicked: if (panel.widget) panel.widget.set("bubbles", !checked)
    }

    Toggle {
      width: parent.width
      label: "Water particles"
      description: "Fine suspended specks drifting with the current"
      foreground: panel.fg
      checked: panel.service ? panel.service.particles === true : true
      onClicked: if (panel.widget) panel.widget.set("particles", !checked)
    }

    Toggle {
      width: parent.width
      label: "Pause on fullscreen"
      description: "Freeze the tank while a window is fullscreen on that monitor"
      foreground: panel.fg
      checked: panel.service ? panel.service.pauseOnFullscreen === true : true
      onClicked: if (panel.widget) panel.widget.set("pauseOnFullscreen", !checked)
    }
  }
}
