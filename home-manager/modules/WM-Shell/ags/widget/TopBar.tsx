import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import Time from "./bar modules/Time"
import { Workspaces } from "./bar modules/Workspaces"

export default function TopBar(gdkmonitor: Gdk.Monitor) {
    const { TOP } = Astal.WindowAnchor

    return <window
        visible
        cssClasses={["Bar"]}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP}
        application={App}>
        <centerbox cssName="centerbox">
            <box />
            {Workspaces}
            {Time()}
        </centerbox>
    </window>
}