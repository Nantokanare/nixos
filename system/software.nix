{pkgs, ...}: {
  imports = [
    ./software/shl.nix
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
    vifm
    vlc
    wget
    wshowkeys
  ];
}
