{
  pkgs,
  system,
  inputs,
  ...
}:
{
  # enable for flatpak (spotify)
  services.flatpak.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    discord
    thunderbird # email client
    nemo # gui file manager
    libreoffice
    # multimedia
    nicotine-plus # soulseek client
    stremio # media center
    vlc # media player
    strawberry # music player and tagger

    # TUI
    rmpc # music player
  ];
}
