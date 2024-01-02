{pkgs, ...}: {
  imports = [
    ./software/shell.nix
  ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    alsa-utils
    blueman
    brave
    btop
    firefox
    fish
    fzf
    git
    home-manager
    htop
    keepassxc
    libyubikey
    mpv
    neofetch
    neovim
    nerdfonts
    pamixer
    pavucontrol
    pfetch
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
    yubico-pam
    yubico-piv-tool
    yubioath-flutter
  ];
}
