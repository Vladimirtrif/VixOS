import { Gtk } from "astal/gtk4"
import { rofi_scripts } from "../../consts"

export const Audio: Gtk.Widget = <button onClicked={rofi_scripts + "/Audio/main_audio.sh"}>
    <label label={""} />
</button>