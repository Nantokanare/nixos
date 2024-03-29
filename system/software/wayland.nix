{
  config,
  lib,
  username,
  pkgs,
  ...
}: {
  imports = [
    ./../dbus.nix
    ./../security/gnome-keyrings.nix
    ./../fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    wayland
    wlroots
    dwl
    waydroid
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    eww-wayland
    wayland-utils
    mako
    shikane
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    updateDbusEnvironment = true;
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
