{
  config,
  lib,
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    ./sh.nix
    ./nvim.nix
    ./tmux.nix
    ./starship.nix
  ];

  # Collection of useful CLI apps
  #  home.packages = with pkgs; [
  #    # Command Line
  #    disfetch
  #    neofetch
  #    lolcat
  #    cowsay
  #    onefetch
  #    cava
  #    gnugrep
  #    gnused
  #    killall
  #    libnotify
  #    bat
  #    eza
  #    fd
  #    bottom
  #    ripgrep
  #    rsync
  #    htop
  #    hwinfo
  #    unzip
  #    octave
  #    w3m
  #    fzf
  #    pandoc
  #    pciutils
  #  ];
}
