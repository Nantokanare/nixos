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
        waypaper
        wpaperd
        base16-schemes
        basez
        dmenu
        feh
        i3-ratiosplit
        i3-resurrect
        i3lock
        i3nator
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
