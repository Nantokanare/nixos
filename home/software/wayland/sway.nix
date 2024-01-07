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
        "213" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
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
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;
        margin = "7 7 3 7";
        spacing = 2;
        modules-left = ["custom/os" "custom/sway" "pulseaudio" "cpu" "memory"];
        modules-center = ["sway/window"];
        modules-right = ["idle_inhibitor" "tray" "clock"];

        "custom/os" = {
          "format" = " {} ";
          "exec" = ''echo "" '';
          "interval" = "once";
        };
        cpu = {
          "format" = "{usage}% ";
        };
        memory = {"format" = "{}% ";};
        "format" = "{capacity}% {icon}";
        "format-charging" = "{capacity}% ";
        "format-plugged" = "{capacity}% ";
        #"format-good" = ""; # An empty format will hide the module
        #"format-full" = "";
        "format-icons" = ["" "" "" "" ""];
      };
      pulseaudio = {
        "scroll-step" = 1;
        "format" = "{volume}% {icon}  {format_source}";
        "format-bluetooth" = "{volume}% {icon}  {format_source}";
        "format-bluetooth-muted" = "󰸈 {icon}  {format_source}";
        "format-muted" = "󰸈 {format_source}";
        "format-source" = "{volume}% ";
        "format-source-muted" = " ";
        "format-icons" = {
          "headphone" = "";
          "hands-free" = "";
          "headset" = "";
          "phone" = "";
          "portable" = "";
          "car" = "";
          "default" = ["" "" ""];
        };
        "custom/sway" = {
          "format" = "   {}";
          #     "exec" = ''cat ~/.hyprprofile'';
          "interval" = 3;
          #     "on-click" = "hyprprofile-dmenu";
        };
        "sway/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "1" = "󱚌";
            "2" = "󰖟";
            "3" = "";
            "4" = "󰎄";
            "5" = "󰋩";
            "6" = "";
            "7" = "󰄖";
            "8" = "󰑴";
            "9" = "󱎓";
            "scratch_term" = "_";
            "scratch_ranger" = "_󰴉";
            "scratch_musikcube" = "_";
            "scratch_btm" = "_";
            "scratch_geary" = "_";
            "scratch_pavucontrol" = "_󰍰";
          };
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰾪";
          };
        };
        tray = {
          #"icon-size" = 21;
          "spacing" = 10;
        };
        clock = {
          "interval" = 1;
          "format" = "{:%a %Y-%m-%d %I:%M:%S %p}";
          "timezone" = "${timezone}";
          "tooltip-format" = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        # "on-click" = "pypr toggle pavucontrol && hyprctl dispatch bringactivetotop";
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
