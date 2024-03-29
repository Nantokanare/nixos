{
  pkgs,
  wm,
  shell,
  wmtype,
  ...
}: {
  imports = [
    ./software/cli.nix
    ./software/virt.nix
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
    #   python312Packages.qt-material
    python3Full
    python-qt
    qt6.full
    gtkd
    libreoffice-qt
    keepassxc
    mpv
    nix-ld
    imv
    xfce.thunar
    nerdfonts
    pamixer
    pavucontrol
    plymouth
    qbittorrent
    syncthing
    vlc
    wshowkeys
  ];
  programs = {
    nix-ld.enable = true;
    thunar.enable = true;
  };

  xdg = {
    sounds.enable = true;
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];
    };
  };
}
