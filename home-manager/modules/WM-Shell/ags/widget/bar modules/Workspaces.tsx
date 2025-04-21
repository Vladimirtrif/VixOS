import { Gtk } from "astal/gtk4"

export const Workspaces: Gtk.Widget = <menubutton
    hexpand
    halign={Gtk.Align.CENTER}
>
    <label label={"Workspaces"} />
    <popover>
    </popover>
</menubutton>
