{
  config,
  lib,
  pkgs,
  stdenv,
  toString,
  browser,
  term,
  spawnEditor,
  font,
  # stylix,
  ...
}: {
  imports = [
    ./../../../../../software/terminal/${term}.nix
    # ./hyprbars.nix
    #   (import ../../app/dmenu-scripts/networkmanager-dmenu.nix {
    #     dmenu_command = "fuzzel -d";
    #     inherit config lib pkgs;
    #   })
    #   import ./hyprprofiles/hyprprofiles.nix {
    #      dmenuCmd = "fuzzel -d";
    #      inherit config lib pkgs;
    #    })
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, F, fullscreen"
        "$mod, T, exec, alacritty"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, F, fullscreen,"
        "$mod, E, exec, vifm"
        "$mod, V, togglefloating,"
        "$mod, R, exec, wofi --show drun"
        "$mod, P, pseudo, # dwindle"
        "$mod, J, togglesplit, # dwindle"
        "$mod, B, exec, ${browser}"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];
    };
  };

  #    (pkgs.writeScriptBin "sct" ''
  #      #!/bin/sh
  #      killall wlsunset &> /dev/null;
  #      if [ $# -eq 1 ]; then
  #        temphigh=$(( $1 + 1 ))
  #        templow=$1
  #        wlsunset -t $templow -T $temphigh &> /dev/null &
  #      else
  #        killall wlsunset &> /dev/null;
  #      fi
  #    '')
  #    (pkgs.writeScriptBin "obs-notification-mute-daemon" ''
  #      #!/bin/sh
  #      while true; do
  #        if pgrep -x .obs-wrapped > /dev/null;
  #          then
  #            pkill -STOP fnott;
  #            #emacsclient --eval "(org-yaap-mode 0)";
  #          else
  #            pkill -CONT fnott;
  #            #emacsclient --eval "(if (not org-yaap-mode) (org-yaap-mode 1))";
  #        fi
  #        sleep 10;
  #      done
  #    '')
  #    (pkgs.writeScriptBin "suspend-unless-render" ''
  #      #!/bin/sh
  #      if pgrep -x nixos-rebuild > /dev/null || pgrep -x home-manager > /dev/null || pgrep -x kdenlive > /dev/null || pgrep -x FL64.exe > /dev/null || pgrep -x blender > /dev/null || pgrep -x flatpak > /dev/null;
  #      then echo "Shouldn't suspend"; sleep 10; else echo "Should suspend"; systemctl suspend; fi
  #    '')
  #    (pkgs.writeScriptBin "hyprworkspace" ''
  #      #!/bin/sh
  #      # from https://github.com/taylor85345/hyprland-dotfiles/blob/master/hypr/scripts/workspace
  #      monitors=/tmp/hypr/monitors_temp
  #      hyprctl monitors > $monitors
  #
  #      if [[ -z $1 ]]; then
  #        workspace=$(grep -B 5 "focused: no" "$monitors" | awk 'NR==1 {print $3}')
  #      else
  #        workspace=$1
  #      fi
  #
  #      activemonitor=$(grep -B 11 "focused: yes" "$monitors" | awk 'NR==1 {print $2}')
  #      passivemonitor=$(grep  -B 6 "($workspace)" "$monitors" | awk 'NR==1 {print $2}')
  #      #activews=$(grep -A 2 "$activemonitor" "$monitors" | awk 'NR==3 {print $1}' RS='(' FS=')')
  #      passivews=$(grep -A 6 "Monitor $passivemonitor" "$monitors" | awk 'NR==4 {print $1}' RS='(' FS=')')
  #
  #      if [[ $workspace -eq $passivews ]] && [[ $activemonitor != "$passivemonitor" ]]; then
  #       hyprctl dispatch workspace "$workspace" && hyprctl dispatch swapactiveworkspaces "$activemonitor" "$passivemonitor" && hyprctl dispatch workspace "$workspace"
  #        echo $activemonitor $passivemonitor
  #      else
  #        hyprctl dispatch moveworkspacetomonitor "$workspace $activemonitor" && hyprctl dispatch workspace "$workspace"
  #      fi
  #
  #      exit 0
  #
  #    '')
  #    (pkgs.python3Packages.buildPythonPackage rec {
  #      pname = "pyprland";
  #      version = "1.4.1";
  #      src = pkgs.fetchPypi {
  #        inherit pname version;
  #        sha256 = "sha256-JRxUn4uibkl9tyOe68YuHuJKwtJS//Pmi16el5gL9n8=";
  #      };
  #      format = "pyproject";
  #      propagatedBuildInputs = with pkgs; [
  #        python3Packages.setuptools
  #        python3Packages.poetry-core
  #        poetry
  #      ];
  #      doCheck = false;
  #    })
  #  ];
  #  home.file.".config/hypr/pyprland.json".text = ''
  #    {
  #      "pyprland": {
  #        "plugins": ["scratchpads", "magnify"]
  #      },
  #      "scratchpads": {
  #        "term": {
  #          "command": "alacritty --class scratchpad",
  #          "margin": 50
  #        },
  #        "ranger": {
  #          "command": "kitty --class scratchpad -e ranger",
  #          "margin": 50
  #        },
  #        "musikcube": {
  #          "command": "alacritty --class scratchpad -e musikcube",
  #          "margin": 50
  #        },
  #        "btm": {
  #          "command": "alacritty --class scratchpad -e btm",
  #          "margin": 50
  #        },
  #        "geary": {
  #          "command": "geary",
  #          "margin": 50
  #        },
  #        "pavucontrol": {
  #          "command": "pavucontrol",
  #          "margin": 50,
  #          "unfocus": "hide",
  #          "animation": "fromTop"
  #        }
  #      }
  #    }
  #  '';

  #clock,
  #battery,
  #cpu,
  #memory,
  #disk,
  #temperature,
  #backlight,
  #network,
  #pulseaudio,
  #wireplumber,
  #custom-media,
  #tray,
  #mode,
  #idle_inhibitor,
  #scratchpad,

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = font + ":size=13";
        terminal = "${pkgs.${term}}/bin/${term}";
      };
   #   colors = {
   #     background = config.lib.stylix.colors.base00 + "e6";
   #     text = config.lib.stylix.colors.base07 + "ff";
   #     match = config.lib.stylix.colors.base05 + "ff";
   #     selection = config.lib.stylix.colors.base08 + "ff";
   #     selection-text = config.lib.stylix.colors.base00 + "ff";
   #     selection-match = config.lib.stylix.colors.base05 + "ff";
   #     border = config.lib.stylix.colors.base08 + "ff";
   #   };
      border = {
        width = 3;
        radius = 7;
      };
    };
  };
  services.fnott = {
    enable = true;
    settings = {
      main = {
        anchor = "bottom-right";
        stacking-order = "top-down";
        min-width = 400;
        title-font = font + ":size=14";
        summary-font = font + ":size=12";
        body-font = font + ":size=11";
        border-size = 0;
      };
    };
  };
}
