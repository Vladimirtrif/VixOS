{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    gaming.enable = lib.mkEnableOption "Enables Gaming";
  };
  config = lib.mkIf config.gaming.enable {
    desktop.enable = lib.mkForce true;
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [ protonup-ng ];
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d/";
    };
  };
}
