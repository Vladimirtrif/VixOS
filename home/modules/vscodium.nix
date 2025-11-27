{
  pkgs,
  config,
  vars,
  ...
}:
{
  stylix.targets.vscode.enable = false;
  catppuccin.vscode.profiles.default.enable = true;
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    #mutableExtensionsDir = false;
    profiles.default = {

      # some extensions not packaged in NixOS
      # or don't support vscodium (ms ones), so they
      # require manual install

      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc-icons
        jnoortheen.nix-ide
        ocamllabs.ocaml-platform
        tomoki1207.pdf
        asvetliakov.vscode-neovim
        # open remote ssh for vscodium jeanp413
        # code together live
      ];
      userSettings = {
        "editor.hover.enabled" = true;
        "editor.hover.delay" = 300;
        "editor.formatOnSave" = true;
        "editor.tabSize" = 2;
        "editor.detectIndentation" = true;

        # for extension performance
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };

        # for nix ide extension
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "nixpkgs" = {
          "expr" = "import <nixpkgs> { }";
        };
        "nix.formatterPath" = "nixfmt";
        "formatting" = {
          "command" = [
            "nixfmt"
          ];
        };
        "options" = {
          "nixos" = {
            "expr" = "(buildints.getFlake \"~/VixOS/\").nixosConfigurations.desktop.options";
          };
          "home_manager" = {
            "expr" = "(buildints.getFlake \"~/VixOS/\").homeConfigurations.${vars.username}.options";
          };
        };
        "nix.serverSettings" = { };

        "workbench.editorAssociations" = {
          "*.md" = "vscode.markdown.preview.editor";
        };

        # font/UI
        "editor.fontFamily" = "'${config.stylix.fonts.monospace.name}'";
        "editor.fontLigatures" = "true";
        "terminal.integrated.fontLigatures.enabled" = true;
        "editor.fontSize" = (config.stylix.fonts.sizes.terminal + 2);
        "window.zoomLevel" = 0.25;
        # for catppuccin
        "workbench.iconTheme" = "catppuccin-mocha";
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
  };
}
