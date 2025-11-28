{
  lib,
  config,
  ...
}:

lib.mkIf config.desktop.enable {
  programs.mango.enable = true;
}
