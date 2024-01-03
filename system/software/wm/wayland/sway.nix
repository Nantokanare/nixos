{
  config,
  lib,
  pkgs,
  ...
}: {
  # Import wayland config
  imports = [
    ../wayland.nix
  ];

  programs = {
    sway = {
      enable = true;
    };
    xwayland = {
      enable = true;
    };
  };
}
