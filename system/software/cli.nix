{
  pkgs,
  lib,
  config,
  shell,
  ...
}: {
  imports = [
    ./cli/tmux.nix
  ];
  programs = {
    neovim.defaultEditor = true;
    thefuck.enable = true;
    nano.enable = false;
  };
  environment.systemPackages = [
    pkgs.musikcube
  ];
}
