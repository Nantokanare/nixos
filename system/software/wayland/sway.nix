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
        pulseaudioFull
        rofi
        swaybg
        swaycons
        swayfx
        swaylock-fancy
        swayr
        swayrbar
        waybar
        waypaper
        wpaperd
      ];
      wrapperFeatures.gtk = true;
    };
    xwayland = {
      enable = true;
    };
  };
}
