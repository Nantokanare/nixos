{
  config,
  lib,
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    ./nvim.nix
    ./tmux.nix
    ./starship.nix
    home-manager.nixosModules.default
  ];

  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    disfetch
    neofetch
    lolcat
    cowsay
    onefetch
    cava
    gnugrep
    gnused
    killall
    libnotify
    bat
    eza
    fd
    bottom
    ripgrep
    rsync
    htop
    hwinfo
    unzip
    octave
    w3m
    fzf
    pandoc
    pciutils
  ];
}
