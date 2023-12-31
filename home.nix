{ config, pkgs, username, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  imports = [	  
	  ./modules/software/cli/cli.nix
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
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
