{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "power-rofi";
  runtimeInputs = with pkgs; [
    rofi
    systemd
    hyprlock
  ];
  text = ''
    CHOSEN=$(printf "Shutdown\nSleep\nRestart\nLock\nSuspend\nHibernate" | rofi -dmenu -i)

    case "$CHOSEN" in
        "Shutdown") shutdown now;;
        "Sleep") systemctl suspend-then-hibernate;;
        "Restart") reboot;;
        "Lock") hyprlock;;
        "Suspend") systemctl suspend;;
        "Hibernate") systemctl hibernate;;
    	
    	*) exit 1 ;;
    esac
  '';
}
