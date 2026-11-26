import QtQuick
import Quickshell.Io
import qs.Services

Item {
    id: root

    property string pluginId: ""
    property var pluginService: null
    readonly property var launcher: PopoutService.dankLauncherV2Modal
    property bool pending: false
    property var calculatorContent: null
    property var escapeShortcut: null

    function focusCalculator() {
        if (!pending || !launcher?.spotlightOpen)
            return;

        const content = launcher.spotlightContent;
        const controller = content?.controller;
        const field = content?.searchField;
        if (!controller || !field)
            return;

        pending = false;
        content.suspendSearchUpdates = true;
        field.text = "";
        controller.setSearchQuery("");
        controller.pluginFilter = "calculator";
        calculatorContent = content;
        escapeShortcut = escapeShortcutComponent.createObject(field);
        controller.performSearch();
        field.forceActiveFocus();
    }

    function releaseCalculator() {
        if (escapeShortcut) {
            escapeShortcut.enabled = false;
            escapeShortcut.destroy();
            escapeShortcut = null;
        }
        if (calculatorContent)
            calculatorContent.suspendSearchUpdates = false;
        calculatorContent = null;
    }

    Component {
        id: escapeShortcutComponent

        Shortcut {
            sequence: "Escape"
            context: Qt.WindowShortcut
            autoRepeat: false
            onActivated: root.launcher?.hide()
        }
    }

    // Both the popup and its input can be loaded lazily on the first invocation.
    onLauncherChanged: Qt.callLater(root.focusCalculator)

    Connections {
        target: root.launcher

        function onSpotlightOpenChanged() {
            if (root.launcher.spotlightOpen)
                Qt.callLater(root.focusCalculator);
            else
                root.releaseCalculator();
        }

        function onSpotlightContentChanged() {
            Qt.callLater(root.focusCalculator);
        }

        function onDialogClosed() {
            root.pending = false;
        }
    }

    Connections {
        target: root.calculatorContent?.searchField ?? null

        function onTextChanged() {
            const content = root.calculatorContent;
            content.actionPanel?.hide();
            content.controller.setSearchQuery(content.searchField.text);
        }
    }

    Connections {
        target: root.calculatorContent?.controller ?? null

        function onPluginFilterChanged() {
            const content = root.calculatorContent;
            const controller = content.controller;
            if (controller.pluginFilter === "calculator")
                return;

            // Restore the filter before Spotlight searches after an extra Backspace.
            if (controller.pluginFilter === "" && controller.searchMode === "plugins" && content.searchField.text === "") {
                controller.pluginFilter = "calculator";
                return;
            }

            root.releaseCalculator();
        }

        function onSearchModeChanged() {
            if (root.calculatorContent.controller.searchMode !== "plugins")
                root.releaseCalculator();
        }
    }

    Component.onDestruction: root.releaseCalculator()

    IpcHandler {
        target: "calculator-popup"

        function open(): string {
            if (!root.pluginService?.getLauncherPlugin("calculator"))
                return "CALCULATOR_NOT_AVAILABLE";

            root.releaseCalculator();
            root.pending = true;
            PopoutService.openDankLauncherV2WithMode("plugins");
            Qt.callLater(root.focusCalculator);
            return "CALCULATOR_OPEN_REQUESTED";
        }
    }
}
