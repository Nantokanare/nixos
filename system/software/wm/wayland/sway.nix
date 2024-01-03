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
        basez
        base16-schemes
        dmenu
        rofi
        swayfx
        swaybg
        i3lock
        waybar
        i3-resurrect
        i3nator
        i3-ratiosplit
        pulseaudioFull
        nitrogen
        picom
      ];
    };
    xwayland = {
      enable = true;
    };
  };
}
