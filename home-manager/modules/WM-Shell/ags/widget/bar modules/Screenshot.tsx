import { Gtk } from "astal/gtk4"
import { rofi_scripts } from "../../consts"

export const Screenshot: Gtk.Widget = <button onClicked={rofi_scripts + "hyprshot.sh"}>
    <label label={"sc"} />
</button>