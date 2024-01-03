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
    sway = {
      enable = true;
    };
  xwayland = {
      enable = true;
  };
  };
}
