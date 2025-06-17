{ pkgs, config, ... }:
{
  stylix.targets.vscode.enable = false;
  catppuccin.vscode.enable = true;
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
     profiles.default.userSettings = {
      "editor.fontFamily" = "'${config.stylix.fonts.monospace.name}'";
      "editor.fontLigatures" = "true";
      "terminal.integrated.fontLigatures.enabled" = true;
      "editor.fontSize" = (config.stylix.fonts.sizes.terminal + 2);
      "window.zoomLevel" = 0.25;

      # for catppuccin
      # we try to make semantic highlighting look good
      "editor.semanticHighlighting.enabled" = true;
      # prevent VSCode from modifying the terminal colors
      "terminal.integrated.minimumContrastRatio" = 1;
      # make the window's titlebar use the workbench colors
      "window.titleBarStyle" = "custom";
      # applicable if you use Go, this is an opt-in flag!
      "gopls" = {
        "ui.semanticTokens" = true;
        };
     };
  }; 
}
