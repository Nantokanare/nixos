{
  config,
  lib,
  username,
  pkgs,
  ...
}: {
  imports = [
    ./../pipewire.nix
    ./../dbus.nix
    ./../gnome-keyring.nix
    ./../fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    wayland
    waydroid
    eww-wayland
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    xkbOptions = "caps:escape";
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
        autoLogin = {
          enable = true;
          user = "${username}";
        };
      };
    };
  };
}
