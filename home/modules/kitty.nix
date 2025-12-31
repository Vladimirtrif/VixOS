{ lib, osConfig, ... }:
lib.mkIf osConfig.desktop.enable {
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      tab_bar_edge = "top";
      kitty_mod = "Ctrl+Shift";
    };
    keybindings = {
      "kitty_mod+t" = "new_tab_with_cwd";
      "kitty_mod+Alt+t" = "new_tab";
      "kitty_mod+j" = "next_tab";
      "kitty_mod+k" = "previous_tab";
      "kitty_mod+d" = "close_tab";
    };
    /*
       extraConfig = ''

       '';
    */
  };

}
