{
  pkgs,
  lib,
  config,
  shell,
  ...
}: {
  imports = [
    ./cli/starship.nix
  ];
  programs = {
    neovim.defaultEditor = true;
    thefuck.enable = true;
    nano.enable = false;
  };
  environment.systemPackages = with pkgs; [
    musikcube
    browsh
    btop
    cron
    feh
    fzf
    zoxide
    git
    htop
    libsixel
    neofetch
    neovim
    pfetch
    wezterm
    tldr
    ranger
    starship
    taskwarrior
    taskwarrior-tui
    tmux
    ueberzug
    vifm
    wget
    yazi
    zellij
  ];
}
