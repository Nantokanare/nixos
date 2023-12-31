{ config, pkgs, username, ... }:

{
  home.username = "nantokanare";
  home.homeDirectory = "/home/${username}";

  imports = [	  
	  ./modules/software/cli/cli.nix
  ];

  home.packages = with pkgs; [
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

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
