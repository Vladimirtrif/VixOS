import { Gtk } from "astal/gtk4"

export const Power: Gtk.Widget = <menubutton
    hexpand
    halign={Gtk.Align.CENTER}
>
    <label label={"P"} />
    <popover>
    </popover>
</menubutton>