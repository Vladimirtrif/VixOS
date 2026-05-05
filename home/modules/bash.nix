{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = lib.mkAfter ''
      # Launch Hyprland on startup
      [[ "$(tty)" == /dev/tty1 ]] && Hyprland

      # Source the git-prompt script from the git package
      GIT_PROMPT="${pkgs.git}/share/git/contrib/completion/git-prompt.sh"
      [ -f "$GIT_PROMPT" ] && . "$GIT_PROMPT"

      # Simple ANSI colors: 34 is Blue (Path), 36 is Cyan (Branch)
      # Stylix already makes these look like Catppuccin Mocha in your terminal
      export PS1='\[\e[34m\]\w\[\e[36m\]$(__git_ps1)\[\e[0m\] $ '
    '';
  };
}
