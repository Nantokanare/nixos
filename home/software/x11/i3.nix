{
  pkgs,
  lib,
  browser,
  term,
  config,
  wm,
  wmtype,
  ...
}: {
  imports = [
    ./${wm}/i3stat.nix
  ];

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      assigns = {
        "1: web" = [{class = "^Firefox$";}];
        "0: extra" = [
          {
            class = "^Firefox$";
            window_role = "About";
          }
        ];
      };
      #    bars = {
      #    };
      startup = [
        # {
        #   command = "systemctl --user restart polybar";
        #   always = true;
        #   notification = false;
        # }
        # {
        #   command = "dropbox start";
        #   notification = false;
        # }
        {command = "${browser}";}
        {command = "${term}";}
      ];
      modifier = "Mod4";
      #  defaultWorkspace = "workspace number 6";
      keybindings = {
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% ";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec volumectl -m toggle-mute";
        #         let
        #           modifier = config.xsession.windowManager.i3.config.modifier;
        #         in lib.mkOptionDefault {
        #           "${modifier}+Return" = "exec i3-sensible-terminal";
        #           "${modifier}+Shift+q" = "kill";
        #           "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
        #         }
      };

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
      floating = {
        border = 2;
        titlebar = false;
        criteria = [
          {
            title = "Steam - Update News";
          }
          {
            class = "Pavucontrol";
          }
        ];
      };
    };
  };
}
