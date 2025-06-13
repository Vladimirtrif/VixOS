{ pkgs, config, ... }:
{
  stylix.targets.vscode.enable = false;
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    #profiles.default.userSettings = {
     # "editor.fontFamily" = "'${config.stylix.fonts.monospace.name}', monospace";
     # "editor.fontLigatures" = "true";
    #};
  };
}
