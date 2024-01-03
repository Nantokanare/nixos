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
        i3status-rust
        i3lock
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
