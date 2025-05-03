import { Gtk } from "astal/gtk4"

export const Audio: Gtk.Widget = <menubutton
    hexpand
    halign={Gtk.Align.CENTER}
>
    <label label={"A"} />
    <popover>
    </popover>
</menubutton>