{
  pkgs,
  wm,
  wmtype,
  ...
}: {
  imports = [
    ./software/cli.nix
    ./software/${wmtype}/${wm}.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    alsa-utils
    blueman
    brave
    btop
    cron
    feh
    firefox
    fzf
    git
    home-manager
    htop
    keepassxc
    libsixel
    mpv
    neofetch
    neovim
    nerdfonts
    pamixer
    pavucontrol
    pfetch
    plymouth
    qbittorrent
    ranger
    starship
    syncthing
    tldr
    tmux
    ueberzug
    vifm
    vlc
    wget
    wshowkeys
    yazi
    zellij
  ];
  programs.nix-ld.enable = true;
}
