{
  pkgs,
  lib,
  config,
  shell,
  ...
}: {
  imports = [
  ];
  programs = {
    neovim.defaultEditor = true;
    thefuck.enable = true;
    nano.enable = false;
  };
}
