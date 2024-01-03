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
      extraPackages = with pkgs; [
        base16-schemes
        basez
        dmenu
        i3-ratiosplit
        i3-resurrect
        feh
        i3lock
        i3nator
        sirula
        nitrogen
        picom
        pulseaudioFull
        rofi
        swaybg
        swayfx
        waybar
      ];
    };
    xwayland = {
      enable = true;
    };
  };
}
