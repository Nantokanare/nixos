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
    firefox
    btop
    cron
    feh
    fzf
    git
    home-manager
    htop
    keepassxc
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
    libsixel
    vifm
    vlc
    wget
    wshowkeys
    zellij
    yazi
  ];
  programs.nix-ld.enable = true;
}
