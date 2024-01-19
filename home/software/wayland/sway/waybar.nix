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
            "8" = "";
            "9" = "";
            "10" = "󱃸";
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
