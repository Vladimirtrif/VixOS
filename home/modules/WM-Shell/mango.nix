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

in
{
  wayland.windowManager.mango = lib.mkIf osConfig.desktop.enable {
    enable = true;
    settings = ''
      # Keybinds

      # Two modes, default (navigation) and editing
      keymode=common
      bind=SUPER,Escape,setkeymode,default
      bind=SUPER,e,setkeymode,editing

      keymode=default
      bind=SUPER,t,spawn,${terminal}
      bind=SUPER,b,spawn, ${browser}
      bind=SUPER,m,spawn, ${email}
      bind=SUPER,r,spawn, ${menu}
      bind=SUPER,h,focusdir,left
      bind=SUPER,j,focusdir,down
      bind=SUPER,k,focusdir,up
      bind=SUPER,l,focusdir,right

      bind=SUPER,f,togglefullscreen
      bind=SUPER,c,killclient

      bind=SUPER,s,viewtoleft
      bind=SUPER,d,viewtoright

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

      keymode=editing
      bind=SUPER,h,exchange_client,left
      bind=SUPER,j,exchange_client,down
      bind=SUPER,k,exchange_client,up
      bind=SUPER,l,exchange_client,right

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

    '';
  };

}
