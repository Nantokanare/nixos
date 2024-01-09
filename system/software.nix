{
  pkgs,
  wm,
  shell,
  wmtype,
  ...
}: {
  imports = [
    ./software/cli.nix
    ./software/shells.nix
    ./software/${wmtype}/${wm}.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    alsa-utils
    blueman
    brave
    firefox
    base16-schemes
    basez
    home-manager
    libreoffice-qt
    keepassxc
    mpv
    imv
    nerdfonts
    pamixer
    pavucontrol
    plymouth
    qbittorrent
    syncthing
    vlc
    wshowkeys
  ];
  programs.nix-ld.enable = true;
}
