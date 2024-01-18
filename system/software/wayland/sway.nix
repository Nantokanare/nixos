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
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
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
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland-egl
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
      '';
    };
    xwayland = {
      enable = true;
    };
  };
}
