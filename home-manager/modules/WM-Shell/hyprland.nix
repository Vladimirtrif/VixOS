{ config, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      # MONITORS
      monitor = [
        ",preferred,auto,auto"
      ];

      # MY PROGRAMS
      "$terminal" = "kitty";
      "$menu" = "rofi";
      "$browser" = "zen";
      "$email" = "thunderbird";
      "$music_player" = "strawberry";
      "$ide" = "codium -d";
      "$fileManager" = "nemo";

      # scripts, To DO: replce with nix var for
      # rofi
      "$quickSettings" = "/home/vova/VixOS/scripts/Rofi/quickSettings.sh";
      "$screenshots" = "/home/vova/VixOS/scripts/Rofi/hyprshot.sh";
      "$power" = "/home/vova/VixOS/scripts/Rofi/power.sh";
      "$sysinfoRofi" = "/home/vova/VixOS/scripts/Rofi/sysinfo.sh";
      # dunst
      "$sysinfo" = "/home/vova/VixOS/scripts/Dunst/sysinfo.sh";

      # AUTOSTART
      exec-once = [
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        #"waybar"
        #"~/VixOS/home-manager/modules/WM-Shell/ags/result/bin/my-shell"
        "[workspace 1 silent] $ide"
        "[workspace 2 silent] $browser"
        "[workspace 3 silent] $music_player"
        #"[workspace 4 silent] $email"
        #"[workspace 3 silent] discord"
      ];

      # ENV VARIABLES
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      # DEBUG
      #"debug:disable_logs" = "false";

      # LOOK AND FEEL
      general = {
        "gaps_in" = "6";
        "gaps_out" = "13, 13, 13, 13";

        "border_size" = "2";

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = lib.mkForce "0xff${config.lib.stylix.colors.base0E}";
        "col.inactive_border" = lib.mkForce "0xff${config.lib.stylix.colors.base04}";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        "resize_on_border" = "false";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        "allow_tearing" = "false";

        "layout" = "dwindle";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        "rounding" = "10";

        # Change transparency of focused and unfocused windows
        "active_opacity" = "1.0";
        "inactive_opacity" = "1.0";

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          "enabled" = "true";
          "size" = "3";
          "passes" = "1";
          "vibrancy" = "0.1696";
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        "enabled" = "true";

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 3, myBezier"
          "windowsOut, 1, 4, default, popin 80%"
          "border, 1, 5, default"
          "borderangle, 1, 4, default"
          "fade, 1, 4, default"
          "workspaces, 1, 4, default"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        "pseudotile" = "true"; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        "preserve_split" = "true"; # You probably want this
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        "new_status" = "master";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        "force_default_wallpaper" = "1"; # Set to 0 or 1 to disable the anime mascot wallpapers
        #"disable_hyprland_logo" = "false"; # If true disables the random hyprland logo / anime girl background. :(
      };

      # INPUT
      input = {
        "kb_layout" = "us";
        "kb_variant" = "";
        "kb_model" = "";
        "kb_options" = "";
        "kb_rules" = "";

        "follow_mouse" = "1";

        "sensitivity" = "0"; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          "natural_scroll" = "false";
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        "workspace_swipe" = "false";
      };

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device = {
        "name" = "epic-mouse-v1";
        "sensitivity" = "-0.5";
      };

      # KEYBINDINGS
      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = [

        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod SHIFT, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindle
        "$mainMod, F, fullscreen,"

        "$mainMod, E, exec, $fileManager"
        "$mainMod, Q, exec, $terminal"
        "$mainMod, R, exec, $menu -show drun -show-icons"
        "$mainMod, P, exec, $power"
        "$mainMod, I, exec, $sysinfo"
        "$mainMod, S, exec, $screenshots"
        "$mainMod SHIFT, S, exec, $quickSettings"
        "$mainMod SHIFT, I, exec, $sysinfoRofi"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        #move winow with mainmod ctrl + arrow keys
        "$mainMod Control, left, movewindow, l"
        "$mainMod Control, right, movewindow, r"
        "$mainMod Control, up, movewindow, u"
        "$mainMod Control, down, movewindow, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        #"$mainMod Control, S, togglespecialworkspace, magic"
        #"$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      binde = [
        #resize window with mainMod+SHIFT+arrow keys while holding
        "$mainMod SHIFT, left, resizeactive, -30 0"
        "$mainMod SHIFT, right, resizeactive, 30 0"
        "$mainMod SHIFT, up, resizeactive, 0 -30"
        "$mainMod SHIFT, down, resizeactive, 0 30"

        #audio
        ", xf86audioraisevolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"
        ", xf86audiolowervolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
      ];

      # Move window with mouse, resize with mainmod shift arrows
      bindm = [
        "$mainMod, mouse:272, movewindow"
        #"$mainMod, mouse:273, resizewindow"

      ];

      # WINDOWS AND WORKSPACES
      "windowrulev2" = "suppressevent maximize, class:.*"; # You'll probably like this.
      windowrule = [
        "workspace 3, class:^(discord)$"
        "workspace 3, class:^(spotify)$"
      ];
    };
  };
}
