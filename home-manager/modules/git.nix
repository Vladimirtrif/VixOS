{
  programs.git = {
    enable = true;
    userName = "Vladimirtrif";
    userEmail = "vova.trifonov@hotmail.com";
    extraConfig = {
      credential.helper = "!gh auth git-credential";
    };
  };
}
