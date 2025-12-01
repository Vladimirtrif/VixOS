{
  lib,
  osConfig,
  vars,
  ...
}:
{
  programs.git = lib.mkIf osConfig.dev.enable {
    enable = true;
    settings = {
      user = {
        name = vars.git_username;
        email = vars.email;
      };
      credential.helper = "!gh auth git-credential";
    };
  };
}
