{ vars, ... }:
{
  programs.git = {
    enable = true;
    userName = vars.git_username;
    userEmail = vars.email;
    extraConfig = {
      credential.helper = "!gh auth git-credential";
    };
  };
}
