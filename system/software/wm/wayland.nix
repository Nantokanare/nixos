{
  config,
  lib,
  username,
  pkgs,
  ...
}: {
  imports = [
    ./dbus.nix
    ./security/gnome-keyrings.nix
    ./fonts.nix
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
      autoLogin = {
        enable = true;
        user = "${username}";
      };
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
}
