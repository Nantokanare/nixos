{ config, pkgs, username, ... }:

{
<<<<<<< HEAD
  config,
  pkgs,
  username,
  term,
  home-manager,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/" + username;

  imports = [
    ./modules/software/cli/cli.nix
    ./modules/software/terminal/alacritty.nix
=======
  home.username = "nantokanare";
  home.homeDirectory = "/home/nantokanare";

  imports = [	  
	  ./modules/software/cli/cli.nix
>>>>>>> parent of 1553828 (term)
  ];

  home.packages = with pkgs; [
    bat
    bottom
    cava
    cowsay
    disfetch
    eza
    fd
    fzf
    git
    gnugrep
    gnused
    htop
    hwinfo
    killall
    libnotify
    lolcat
    neofetch
    octave
    onefetch
    pandoc
    pciutils
    ranger
    ripgrep
    rsync
    unzip
    w3m
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
