import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import { Variable } from "astal"

const time = (Variable("").poll(1000, "date +\"%I:%M\""))

export default function Time() {
    return <menubutton
        hexpand
        halign={Gtk.Align.CENTER}
    >
        <label label={time()} />
        <popover>
            <Gtk.Calendar />
        </popover>
    </menubutton>
}
