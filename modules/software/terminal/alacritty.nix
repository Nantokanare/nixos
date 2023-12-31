{
  config,
  pkgs,
  lib,
  home-manager,
  ...
}: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.opacity = lib.mkForce 0.65;
  };
}
