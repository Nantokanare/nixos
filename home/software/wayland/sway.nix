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
      terminal = "kitty";
      modifier = "Mod4";
      floating.modifier = "Mod4";
      gaps = {
        smartBorders = "on";
        outer = 4;
      };
    };
  };
  home.packages = with pkgs; [
    alacritty
    kitty
    feh
    killall
    polkit_gnome
    libva-utils
    gsettings-desktop-schemas
    wlr-randr
    wtype
    wl-clipboard
    hyprland-protocols
    hyprpicker
    swayidle
    gtklock
    #swaylock
    #(pkgs.swaylock-effects.overrideAttrs (oldAttrs: {
    #  version = "1.6.4-1";
    #  src = fetchFromGitHub {
    #    owner = "mortie";
    #    repo = "swaylock-effects";
    #    rev = "20ecc6a0a5b61bb1a66cfb513bc357f74d040868";
    #    sha256 = "sha256-nYA8W7iabaepiIsxDrCkG/WIFNrVdubk/AtFhIvYJB8=";
    #  };
    #}))
    swaybg
    fnott
    #hyprpaper
    #wofi
    fuzzel
    keepmenu
    pinentry-gnome
    wev
    grim
    slurp
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    wlsunset
    pavucontrol
    pamixer
  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;
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
        "custom/sway" = {
          "format" = "   {}";
          "exec" = ''cat ~/.hyprprofile'';
          "interval" = 3;
          "on-click" = "hyprprofile-dmenu";
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
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          #"all-outputs" = true;
          #"active-only" = true;
          "ignore-workspaces" = ["scratch" "-"];
          #"show-special" = false;
          #"persistent-workspaces" = {
          #    # this block doesn't seem to work for whatever reason
          #    "eDP-1" = [1 2 3 4 5 6 7 8 9];
          #    "DP-1" = [1 2 3 4 5 6 7 8 9];
          #    "HDMI-A-1" = [1 2 3 4 5 6 7 8 9];
          #    "1" = ["eDP-1" "DP-1" "HDMI-A-1"];
          #    "2" = ["eDP-1" "DP-1" "HDMI-A-1"];
          #    "3" = ["eDP-1" "DP-1" "HDMI-A-1"];
          #    "4" = ["eDP-1" "DP-1" "HDMI-A-1"];
          #    "5" = ["eDP-1" "DP-1" "HDMI-A-1"];
          #    "6" = ["eDP-1" "DP-1" "HDMI-A-1"];
          #    "7" = ["eDP-1" "DP-1" "HDMI-A-1"];
          #    "8" = ["eDP-1" "DP-1" "HDMI-A-1"];
          #    "9" = ["eDP-1" "DP-1" "HDMI-A-1"];
          #};
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
        "on-click" = "pypr toggle pavucontrol && hyprctl dispatch bringactivetotop";
      };
    };
  };
  #    style =
  #      ''
  #        * {
  #            /* `otf-font-awesome` is required to be installed for icons */
  #            font-family: FontAwesome, ''
  #      + font
  #      + ''        ;
  #
  #                  font-size: 20px;
  #              }
  #
  #              window#waybar {
  #                  background-color: #''
  #      + config.lib.stylix.colors.base00
  #      + ''        ;
  #                  opacity: 0.75;
  #                  border-radius: 2px;
  #                  color: #''
  #      + config.lib.stylix.colors.base07
  #      + ''        ;
  #                  transition-property: background-color;
  #                  transition-duration: .1s;
  #              }
  #
  #              window > box {
  #                  border-radius: 8px;
  #                  opacity: 0.94;
  #              }
  #
  #              window#waybar.hidden {
  #                  opacity: 0.2;
  #              }
  #
  #              button {
  #                  border: none;
  #              }
  #
  #              #custom-hyprprofile {
  #                  color: #''
  #      + config.lib.stylix.colors.base0D
  #      + ''        ;
  #              }
  #
  #              /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
  #              button:hover {
  #                  background: inherit;
  #              }
  #
  #              #workspaces button {
  #                  padding: 0 7px;
  #                  background-color: transparent;
  #                  color: #''
  #      + config.lib.stylix.colors.base04
  #      + ''        ;
  #              }
  #
  #              #workspaces button:hover {
  #                  color: #''
  #      + config.lib.stylix.colors.base07
  #      + ''        ;
  #              }
  #
  #              #workspaces button.active {
  #                  color: #''
  #      + config.lib.stylix.colors.base08
  #      + ''        ;
  #              }
  #
  #              #workspaces button.focused {
  #                  color: #''
  #      + config.lib.stylix.colors.base0A
  #      + ''        ;
  #              }
  #
  #              #workspaces button.visible {
  #                  color: #''
  #      + config.lib.stylix.colors.base05
  #      + ''        ;
  #              }
  #
  #              #workspaces button.urgent {
  #                  color: #''
  #      + config.lib.stylix.colors.base09
  #      + ''        ;
  #              }
  #
  #              #clock,
  #              #battery,
  #              #cpu,
  #              #memory,
  #              #disk,
  #              #temperature,
  #              #backlight,
  #              #network,
  #              #pulseaudio,
  #              #wireplumber,
  #              #custom-media,
  #              #tray,
  #              #mode,
  #              #idle_inhibitor,
  #              #scratchpad,
  #              #mpd {
  #                  padding: 0 10px;
  #                  color: #''
  #      + config.lib.stylix.colors.base07
  #      + ''        ;
  #                  border: none;
  #                  border-radius: 8px;
  #              }
  #
  #              #window,
  #              #workspaces {
  #                  margin: 0 4px;
  #              }
  #
  #              /* If workspaces is the leftmost module, omit left margin */
  #              .modules-left > widget:first-child > #workspaces {
  #                  margin-left: 0;
  #              }
  #
  #              /* If workspaces is the rightmost module, omit right margin */
  #              .modules-right > widget:last-child > #workspaces {
  #                  margin-right: 0;
  #              }
  #
  #              #clock {
  #                  color: #''
  #      + config.lib.stylix.colors.base0D
  #      + ''        ;
  #              }
  #
  #              #battery {
  #                  color: #''
  #      + config.lib.stylix.colors.base0B
  #      + ''        ;
  #              }
  #
  #              #battery.charging, #battery.plugged {
  #                  color: #''
  #      + config.lib.stylix.colors.base0C
  #      + ''        ;
  #              }
  #
  #              @keyframes blink {
  #                  to {
  #                      background-color: #''
  #      + config.lib.stylix.colors.base07
  #      + ''        ;
  #                      color: #''
  #      + config.lib.stylix.colors.base00
  #      + ''        ;
  #                  }
  #              }
  #
  #              #battery.critical:not(.charging) {
  #                  background-color: #''
  #      + config.lib.stylix.colors.base08
  #      + ''        ;
  #                  color: #''
  #      + config.lib.stylix.colors.base07
  #      + ''        ;
  #                  animation-name: blink;
  #                  animation-duration: 0.2s;
  #                  animation-timing-function: linear;
  #                  animation-iteration-count: infinite;
  #                  animation-direction: alternate;
  #              }
  #
  #              label:focus {
  #                  background-color: #''
  #      + config.lib.stylix.colors.base00
  #      + ''        ;
  #              }
  #
  #              #cpu {
  #                  color: #''
  #      + config.lib.stylix.colors.base0D
  #      + ''        ;
  #              }
  #
  #              #memory {
  #                  color: #''
  #      + config.lib.stylix.colors.base0E
  #      + ''        ;
  #              }
  #
  #              #disk {
  #                  color: #''
  #      + config.lib.stylix.colors.base0F
  #      + ''        ;
  #              }
  #
  #              #backlight {
  #                  color: #''
  #      + config.lib.stylix.colors.base0A
  #      + ''        ;
  #              }
  #
  #              #pulseaudio {
  #                  color: #''
  #      + config.lib.stylix.colors.base0C
  #      + ''        ;
  #              }
  #
  #              #pulseaudio.muted {
  #                  color: #''
  #      + config.lib.stylix.colors.base04
  #      + ''        ;
  #              }
  #
  #              #tray > .passive {
  #                  -gtk-icon-effect: dim;
  #              }
  #
  #              #tray > .needs-attention {
  #                  -gtk-icon-effect: highlight;
  #              }
  #
  #              #idle_inhibitor {
  #                  color: #''
  #      + config.lib.stylix.colors.base04
  #      + ''        ;
  #              }
  #
  #              #idle_inhibitor.activated {
  #                  color: #''
  #      + config.lib.stylix.colors.base0F
  #      + ''        ;
  #              }
  #      '';
  #  };
  #
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
    settings = {
      color = "#" + config.lib.stylix.colors.base00;
    };
  };
}
