{
  term,
  inputs,
  config,
  lib,
  home-manager,
  browser,
  font,
  stylix,
  timezone,
  pkgs,
  ...
}: {
  imports = [
    ./sway/waybar.nix
  ];
  services.swayosd = {
    enable = true;
    maxVolume = 100;
  };
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    systemd = {
      enable = true;
      xdgAutostart = true;
    };
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      floating.modifier = "Mod4";
      bars = [];
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
      window = {
        border = 1;
        hideEdgeBorders = "both";
        titlebar = false;
      };
      startup = [
        {
          command = "systemctl --user restart waybar";
          always = true;
        }
        {command = "${browser}";}
        {command = "${term}";}
        {command = "kdeconnect-cli";}
        {command = "openrgb";}
        {command = "keepassxc";}
        {command = "opensnitch-ui";}
      ];
      assigns = {
        "2: web" = [{class = "^${browser}$";}];
        "6: terminal" = [{class = "^${term}$";}];
        "0: extra" = [
          {
            class = "^Firefox$";
            window_role = "About";
          }
        ];
      };
      keybindings = {
        "${modifier}+Return" = "exec ${term}";

        "${modifier}+b" = "exec ${browser}";
        "${modifier}+d" = "exec --no-startup-id dmenu_run";
        "${modifier}+m" = "exec --no-startup-id rofi -show run";

        "${modifier}+Shift+c" = "kill";
        "${modifier}+Shift+r" = "reload";

        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% ";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec volumectl -m toggle-mute";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";

        # switch to workspace
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        # move focused container to workspace
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

        "${modifier}+r" = "mode resize";

        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";

        # enter fullscreen mode for the focused container
        "${modifier}+f" = "fullscreen toggle";

        # change container layout (stacked, tabbed, toggle split)
        "${modifier}+s" = "layout stacking";
        "${modifier}+e" = "layout toggle split";

        # toggle tiling / floating
        "${modifier}+Shift+space" = "floating toggle";

        # change focus between tiling / floating windows
        "${modifier}+space" = "focus mode_toggle";
        # kill focused window
        "${modifier}+q" = "kill";
        #
        ## start dmenu (a program launcher)
        ## A more modern dmenu replacement is rofi:
        ## bindcode ${modifier}+40 exec "rofi -modi drun,run -show drun"
        ## There also is i3-dmenu-desktop which only displays applications shipping a
        ## .desktop file. It is a wrapper around dmenu, so you need that installed.
        ## bindcode ${modifier}+40 exec --no-startup-id i3-dmenu-desktop
        #
        ## change focus
        #"${modifier}+j focus left
        #"${modifier}+k focus down
        #"${modifier}+l focus up
        #"${modifier}+semicolon focus right
        #
        ## alternatively, you can use the cursor keys:
        #"${modifier}+Left focus left
        #"${modifier}+Down focus down
        #"${modifier}+Up focus up
        #"${modifier}+Right focus right
        #
        # move focused window
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        # alternatively, you can use the cursor keys:
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        ## split in horizontal orientation
        "${modifier}+h" = "split h";
        #
        ## split in vertical orientation
        "${modifier}+v" = "split v";
        #
        ## focus the parent container
        #"${modifier}+a focus parent
        #
        ## focus the child container
        ##"${modifier}+d focus child
        #
        #
        #
        #
      };
    };
  };

  programs = {
    swaylock = {
      enable = true;
    };
    eww = {
      enable = true;
      package = pkgs.eww-wayland;
      configDir = ./../../dotfiles/eww;
    };
  };
  home.packages = with pkgs; [
    alacritty
    feh
    fnott
    fuzzel
    grim
    gsettings-desktop-schemas
    gtklock
    i3blocks
    ironbar
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
    swayosd
    wev
    wl-clipboard
    wlr-randr
    wlsunset
    wofi
    wtype
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
  ];
}
