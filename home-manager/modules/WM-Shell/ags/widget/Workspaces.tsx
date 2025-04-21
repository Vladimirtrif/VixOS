import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import { Variable } from "astal"

export default function Workspaces(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT } = Astal.WindowAnchor

    return <window
        visible
        cssClasses={["Bar"]}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT}
        application={App}>
        <centerbox cssName="centerbox">
            <box />
            <menubutton
                hexpand
                halign={Gtk.Align.CENTER}>
                <label label={"Workspaces"} />
                <popover>
                </popover>
            </menubutton>
        </centerbox>
    </window>
}