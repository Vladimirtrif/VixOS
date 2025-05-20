const { GLib } = imports.gi;

export const script_dir: string = GLib.get_home_dir() + "/VixOS/scripts/"
export const rofi_scripts: string = script_dir + "Rofi/"