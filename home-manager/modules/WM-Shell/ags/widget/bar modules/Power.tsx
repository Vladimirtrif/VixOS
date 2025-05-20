import { Gtk } from "astal/gtk4"
import { rofi_scripts } from "../../consts"

export const Power: Gtk.Widget = <button onClicked={rofi_scripts + "power.sh"}>
    <label label={"⏻"} />
</button>