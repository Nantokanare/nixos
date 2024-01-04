{
  config,
  lib,
  pkgs,
  ...
}: {
  # Import wayland config
  imports = [
    ../wayland.nix
    ../../pipewire.nix
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
