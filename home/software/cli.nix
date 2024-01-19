{
  config,
  lib,
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    ./cli/nvim.nix
    ./cli/sh.nix
    ./cli/starship.nix
    ./cli/tldr.nix
    ./cli/tmux.nix
  ];
  programs = {
    zoxide.enable = true;
    zathura.enable = true;
    eza = {
      enable = true;
      git = true;
      icons = true;
    };
  };
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
