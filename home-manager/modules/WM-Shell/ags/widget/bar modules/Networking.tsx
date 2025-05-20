import { Gtk } from "astal/gtk4"
import { rofi_scripts } from "../../consts"

export const Networking: Gtk.Widget = <button onClicked={rofi_scripts + "networking.sh"}>
    <label label={""} />
</button>