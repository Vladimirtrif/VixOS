{
  pkgs,
  lib,
  osConfig,
  ...
}:
let
  scripts = import ../../../scripts/bundle.nix { inherit pkgs; };
  menu = "rofi -show drun -show-icons";
  terminal = "kitty";
  browser = "zen";
  email = "thunderbird";
  editor = "codium -d";
  music_player = "com.spotify.Client";
in
{
  wayland.windowManager.mango = lib.mkIf osConfig.desktop.enable {
    enable = true;
    settings = ''
      # Keybinds
      keymode=common
      bind=SUPER,Escape,setkeymode,default
      bind=SUPER,e,setkeymode,editing


      # Two modes, default (navigation) and editing
      keymode=default

      bind=SUPER,h,focusdir,left
      bind=SUPER,j,focusdir,down
      bind=SUPER,k,focusdir,up
      bind=SUPER,l,focusdir,right

      bind=SUPER,t,spawn,${terminal}
      bind=SUPER,b,spawn, ${browser}
      bind=SUPER,m,spawn, ${email}
      bind=SUPER+SHIFT,m,quit
      bind=SUPER,r,spawn, ${menu}
      bind=SUPER,c,spawn, ${editor}
      bind=SUPER,p,spawn,${lib.getExe scripts.rofi.power}
      bind=SUPER,a,spawn,${lib.getExe scripts.rofi.quickSettings}
      bind=SUPER+SHIFT,c,spawn,${lib.getExe scripts.rofi.screenshot}
      bind=SUPER+SHIFT,i,spawn,${lib.getExe scripts.rofi.sysinfo}
      bind=SUPER,i,spawn,${lib.getExe scripts.dunst.sysinfo}


      bind=SUPER,f,togglefullscreen
      bind=SUPER,q,killclient

      bind=SUPER,s,viewtoleft
      bind=SUPER,d,viewtoright
      bind=SUPER+SHIFT,s,tagtoleft
      bind=SUPER+SHIFT,d,tagtoright

      bind=SUPER,1,view,1
      bind=SUPER,2,view,2
      bind=SUPER,3,view,3
      bind=SUPER,4,view,4
      bind=SUPER,5,view,5
      bind=SUPER,6,view,6
      bind=SUPER,7,view,7
      bind=SUPER,8,view,8
      bind=SUPER,9,view,9
      bind=SUPER,0,view,10

      bind=SUPER+SHIFT,1,tag,1
      bind=SUPER+SHIFT,2,tag,2
      bind=SUPER+SHIFT,3,tag,3
      bind=SUPER+SHIFT,4,tag,4
      bind=SUPER+SHIFT,5,tag,5
      bind=SUPER+SHIFT,6,tag,6
      bind=SUPER+SHIFT,7,tag,7
      bind=SUPER+SHIFT,8,tag,8
      bind=SUPER+SHIFT,9,tag,9
      bind=SUPER+SHIFT,0,tag,10


      keymode=editing

      bind=SUPER,h,exchange_client,left
      bind=SUPER,j,exchange_client,down
      bind=SUPER,k,exchange_client,up
      bind=SUPER,l,exchange_client,right

      bind=SUPER+SHIFT,h,focusdir,left
      bind=SUPER+SHIFT,j,focusdir,down
      bind=SUPER+SHIFT,k,focusdir,up
      bind=SUPER+SHIFT,l,focusdir,right

      bind=SUPER,s,resizewin,-50,+0 #left
      bind=SUPER,f,resizewin,+0,+50 #down
      bind=SUPER,d,resizewin,+0,-50 #up
      bind=SUPER,g,resizewin,+50,+0 #right


      # set all tags to tile by default
      tagrule=id:1,layout_name:tile
      tagrule=id:2,layout_name:tile
      tagrule=id:3,layout_name:tile
      tagrule=id:4,layout_name:tile
      tagrule=id:5,layout_name:tile
      tagrule=id:6,layout_name:tile
      tagrule=id:7,layout_name:tile
      tagrule=id:8,layout_name:tile
      tagrule=id:9,layout_name:tile
      tagrule=id:10,layout_name:tile

      windowrule=tags:2,appid:${browser}
      windowrule=tags:3,appid:${email}
      windowrule=tags:4,appid:${music_player}

      animations=0

    '';

    autostart_sh = ''
      # Start Editor on Tag 1
      mmsg -t 1
      ${editor} &
      ${browser} &
      ${email} &
      sleep 1
      mmsg -t 1
    '';
  };

}
