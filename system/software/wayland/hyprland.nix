{
  config,
  lib,
  wmtype,
  pkgs,
  ...
}: {
  # Import wayland config
  imports = [
    ../${wmtype}.nix
    ../../dbus.nix
    ../../../../../../security/gnome-keyrings.nix
  ];

  programs = {
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };
}
