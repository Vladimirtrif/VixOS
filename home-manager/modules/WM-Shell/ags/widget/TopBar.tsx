import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import Time from "./bar modules/Time"
import Workspaces from "./bar modules/Workspaces"
import { Audio } from "./bar modules/Audio"
import { Power } from "./bar modules/Power"
import { Networking } from "./bar modules/Networking"
import { Screenshot } from "./bar modules/Screenshot"

export default function TopBar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        visible
        cssClasses={["Bar"]}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={LEFT | TOP | RIGHT}
        application={App}>
        <centerbox cssName="centerbox">

            <box type="left" cssClasses={["module_group"]}>
                {Workspaces()}
            </box>

            <box type="center" cssClasses={["module_group"]}>
                {Time()}
            </box>

            <box type="right" cssClasses={["module_group"]}>
                {Audio}
                {Networking}
                {Screenshot}
                {Power}
            </box>

        </centerbox>
    </window>
}