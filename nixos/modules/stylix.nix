{ pkgs, config, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    #base16Scheme = {
    # modified catpuccin mocha
    #base00 = "1e1e2e"; # base
    #base01 = "181825"; # mantle
    #base02 = "313244"; # surface0
    #base03 = "45475a"; # surface1
    #base04 = "585b70"; # surface2
    #base05 = "cdd6f4"; # text
    #base06 = "f5e0dc"; # rosewater
    #base07 = "b4befe"; # lavender
    #base08 = "f38ba8"; # red
    #base09 = "fab387"; # peach
    #base0A = "f9e2af"; # yellow
    #base0B = "a6e3a1"; # green
    #base0C = "94e2d5"; # teal
    #base0D = "89b4fa"; # blue
    #base0E = "cba6f7"; # mauve
    #base0F = "f2cdcd"; # flamingo
    #};
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
    };
    cursor = {
      name = "rose-pine-hyprcursor";
      package = pkgs.rose-pine-hyprcursor;
      size = 24;
    };
    image = ../../Wallpapers/evening-sky.png;
  };
  catppuccin = {
    flavor = "mocha";
  };
}
