{
  pkgs,
  username,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [
      {
        layer = "bottom";
        height = 26;
        modules-left = ["custom/os" "wlr/taskbar" "custom/sway"];
        modules-center = ["sway/workspaces"];
        modules-right = [
          "tray"
          "idle_inhibitor"
          "cpu"
          "memory"
          "disk"
          "pulseaudio"
          "user"
          "clock"
        ];
        #   "custom/network" = {
        #     exec = "${./netspeed}";
        #   };
        cpu = {
          format = "󰓅 {usage}%";
        };
        memory = {
          format = "󰍛 {percentage}%";
        };
        "disk" = {
          "interval" = 30;
          "format" = "{percentage_free}% on {path}";
          "path" = "/";
        };
        tray = {
          #"icon-size" = 21;
          "spacing" = 10;
        };
        "sway/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "1" = "󱚌";
            "2" = "󰖟";
            "3" = "";
            "4" = "";
            "5" = "󰎄";
            "6" = "";
            "7" = "";
            "8" = "󱎓";
            "9" = "";
            "scratch_term" = "_";
            "scratch_ranger" = "_󰴉";
            "scratch_musikcube" = "_";
            "scratch_btm" = "_";
            "scratch_geary" = "_";
            "scratch_pavucontrol" = "_󰍰";
          };
        };
        pulseaudio = {
          "scroll-step" = 5;
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
        };
        user = {
          "format" = "{user} (up {work_M} min ↑)";
          "interval" = 60;
          "height" = 30;
          "width" = 30;
          "icon" = true;
        };

        clock = {
          format = " {:%a %m-%d %H:%M}";
          actions = {
            "on-click-right" = "mode";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
        "custom/os" = {
          "format" = " {} ";
          "exec" = ''echo "" '';
          "interval" = "once";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰾪";
          };
        };
      }
    ];
  };
}
#  programs.waybar = {
#    enable = true;
#    settings = {
#      mainBar = {
#        layer = "top";
#        position = "top";
#        height = 25;
#        margin = "7 7 3 7";
#        spacing = 2;
#        modules-left = ["custom/os" "custom/sway" "pulseaudio" "cpu" "memory"];
#        modules-center = ["sway/window"];
#        modules-right = ["idle_inhibitor" "tray" "clock"];
#
#        cpu = {
#          "format" = "{usage}% ";
#        };
#        memory = {"format" = "{}% ";};
#        "format" = "{capacity}% {icon}";
#        "format-charging" = "{capacity}% ";
#        "format-plugged" = "{capacity}% ";
#        #"format-good" = ""; # An empty format will hide the module
#        #"format-full" = "";
#        "format-icons" = ["" "" "" "" ""];
#      };
#        "custom/sway" = {
#          "format" = "   {}";
#          #     "exec" = ''cat ~/.hyprprofile'';
#          "interval" = 3;
#          #     "on-click" = "hyprprofile-dmenu";
#        };
#
#        clock = {
#          "interval" = 1;
#          "format" = "{:%a %Y-%m-%d %I:%M:%S %p}";
#          "timezone" = "${timezone}";
#          "tooltip-format" = ''
#            <big>{:%Y %B}</big>
#            <tt><small>{calendar}</small></tt>'';
#        };
#        # "on-click" = "pypr toggle pavucontrol && hyprctl dispatch bringactivetotop";
#      };
#    };
#  };
#}
