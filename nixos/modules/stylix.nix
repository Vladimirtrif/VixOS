{ pkgs, inputs, ...}:
{
    stylix = {
        enable = true;
        autoEnable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        image = ../../Wallpapers/minimal_10.jpg;
    };
}