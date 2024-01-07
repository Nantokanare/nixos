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
  ];

  programs = {
    sway = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        feh
        # i3-ratiosplit
        # i3-resurrect
        # i3lock
        # i3nator
        nitrogen
        picom
        pulseaudioFull
        rofi
        swaybg
        swayfx
        swaylock-fancy
        swayr
        swayrbar
        waybar
        waypaper
        wpaperd
      ];
    };
    xwayland = {
      enable = true;
    };
  };
}
