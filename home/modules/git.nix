{
  lib,
  osConfig,
  vars,
  ...
}:
{
  programs.git = lib.mkIf osConfig.dev.enable {
    enable = true;
    userName = vars.git_username;
    userEmail = vars.email;
    extraConfig = {
      credential.helper = "!gh auth git-credential";
    };
  };
}
