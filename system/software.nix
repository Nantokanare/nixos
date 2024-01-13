{
  pkgs,
  wm,
  shell,
  wmtype,
  ...
}: {
  imports = [
    ./software/cli.nix
    ./software/media.nix
    ./software/shells.nix
    ./software/${wmtype}/${wm}.nix
  ];
  qt.enable = true;

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
    python311Packages.qt-material
    qt6.full
    gtkd
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
