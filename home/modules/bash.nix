{ lib, ... }:
{
  programs.bash = {
    enable = true;
    initExtra = lib.mkAfter ''
      export PS1='[\w]$ '
    '';
  };
}
