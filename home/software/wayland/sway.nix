{
  config,
  lib,
  home-manager,
  font,
  stylix,
  timezone,
  pkgs,
  ...
}: {
  imports = [
    ./sway/swaybar.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    config = {
      bars = [];
      terminal = "kitty";
      modifier = "Mod4";
      floating.modifier = "Mod4";
      keycodebindings = {
        "213" = "exec --no-startup-id pamixer --increase 5";
      };
      #  keybindings = {
      #    "XF86AudioRaiseVolume" = v	"exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
      #    "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% ";
      #    "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
      #    #    "XF86AudioMicMute" = "exec volumectl -m toggle-mute";
      #  };
      gaps = {
        top = 4;
        bottom = 4;
        horizontal = 4;
        vertical = 4;
        inner = 4;
        outer = 4;
        left = 4;
        right = 4;
        smartBorders = "on";
        smartGaps = true;
      };
    };
  };
  home.file.".config/gtklock/style.css".text =
    ''
      window {
        background-image: url("''
    + config.stylix.image
    + ''      ");
              background-size: auto 100%;
            }
    '';
  programs.swaylock = {
    enable = true;
  };
  home.packages = with pkgs; [
    wofi
    alacritty
    feh
    fnott
    fuzzel
    grim
    gsettings-desktop-schemas
    gtklock
    keepmenu
    killall
    kitty
    libsForQt5.qt5.qtwayland
    libva-utils
    pamixer
    pavucontrol
    pinentry-gnome
    polkit_gnome
    qt6.qtwayland
    slurp
    swaybg
    swayidle
    waybar
    wev
    wl-clipboard
    wlr-randr
    wlsunset
    wtype
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
  ];
}
