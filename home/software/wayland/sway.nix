{
  term,
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
  services.swayosd.enable = true;
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    systemd.enable = true;
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
        "${modifier}+Shift+r" = "restart";

        #            "${modifier}+Tab" = "workspace back_and_forth";
        "${modifier}+Shift+c" = "kill";
        "${modifier}+Shift+r" = "reload";
        #            "${modifier}+d" = null;
        #            "${modifier}+p" = exec swayConfig.menu;
        #
        #            "${modifier}+Ctrl+Left" = "workspace prev";
        #            "${modifier}+Ctrl+Right" = "workspace next";
        #

        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% ";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec volumectl -m toggle-mute";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";

        # kill focused window
        #"${modifier}+Shift+q kill
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
        ## move focused window
        #"${modifier}+Shift+j move left
        #"${modifier}+Shift+k move down
        #"${modifier}+Shift+l move up
        #"${modifier}+Shift+semicolon move right
        #
        ## alternatively, you can use the cursor keys:
        #"${modifier}+Shift+Left move left
        #"${modifier}+Shift+Down move down
        #"${modifier}+Shift+Up move up
        #"${modifier}+Shift+Right move right
        #
        ## split in horizontal orientation
        #"${modifier}+h split h
        #
        ## split in vertical orientation
        #"${modifier}+v split v
        #
        ## enter fullscreen mode for the focused container
        #"${modifier}+f fullscreen toggle
        #
        ## change container layout (stacked, tabbed, toggle split)
        #"${modifier}+s layout stacking
        #"${modifier}+e layout toggle split
        #
        ## toggle tiling / floating
        #"${modifier}+Shift+space floating toggle
        #
        ## change focus between tiling / floating windows
        #"${modifier}+space focus mode_toggle
        #
        ## focus the parent container
        #"${modifier}+a focus parent
        #
        ## focus the child container
        ##"${modifier}+d focus child
        #
        #
        ## switch to workspace
        #"${modifier}+1 workspace number $ws1
        #"${modifier}+2 workspace number $ws2
        #"${modifier}+3 workspace number $ws3
        #"${modifier}+4 workspace number $ws4
        #"${modifier}+5 workspace number $ws5
        #"${modifier}+6 workspace number $ws6
        #"${modifier}+7 workspace number $ws7
        #"${modifier}+8 workspace number $ws8
        #"${modifier}+9 workspace number $ws9
        #"${modifier}+0 workspace number $ws10
        #
        ## move focused container to workspace
        #"${modifier}+Shift+1 move container to workspace number $ws1
        #"${modifier}+Shift+2 move container to workspace number $ws2
        #"${modifier}+Shift+3 move container to workspace number $ws3
        #"${modifier}+Shift+4 move container to workspace number $ws4
        #"${modifier}+Shift+5 move container to workspace number $ws5
        #"${modifier}+Shift+6 move container to workspace number $ws6
        #"${modifier}+Shift+7 move container to workspace number $ws7
        #"${modifier}+Shift+8 move container to workspace number $ws8
        #"${modifier}+Shift+9 move container to workspace number $ws9
        #"${modifier}+Shift+0 move container to workspace number $ws10
        #
        ## reload the configuration file
        #"${modifier}+Shift+c reload
        ## restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
        ## exit i3 (logs you out of your X session)
        #"${modifier}+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"
        #
        ## resize window (you can also use the mouse for that)
        #mode "resize" {
        #        # These bindings trigger as soon as you enter the resize mode
        #
        #        # Pressing left will shrink the window’s width.
        #        # Pressing right will grow the window’s width.
        #        # Pressing up will shrink the window’s height.
        #        # Pressing down will grow the window’s height.
        #        "j resize shrink width 10 px or 10 ppt
        #        "k resize grow height 10 px or 10 ppt
        #        "l resize shrink height 10 px or 10 ppt
        #        "semicolon resize grow width 10 px or 10 ppt
        #
        #        # same bindings, but for the arrow keys
        #        "Left resize shrink width 10 px or 10 ppt
        #        "Down resize grow height 10 px or 10 ppt
        #        "Up resize shrink height 10 px or 10 ppt
        #        "Right resize grow width 10 px or 10 ppt
        #
        #        # back to normal: Enter or Escape or ${modifier}+r
        #        "Return mode "default"
        #        "Escape mode "default"
        #        "${modifier}+r mode "default"
        #}
        #
        ## # Media player controls
        ## "XF86AudioPlay+ exec playerctl play
        ## "XF86AudioPause+ exec playerctl pause
        ## "XF86AudioNext+ exec playerctl next
        ## "XF86AudioPrev+ exec playerctl previous
        #
        #
        #"${modifier}+r mode "resize"
        #
        #"${modifier}+Shift+minus move scratchpad
        #"${modifier}+minus scratchpad show
        #
        #"${modifier}+g [title="^ranger ::"] scratchpad show
      };
    };
  };
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    #   ".config/sway/config;".source = ./../../dotfiles/sway/config;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.file.".config/gtklock/style.css".text =
    ''
      window {
       background-image: url("''
    + config.stylix.image
    + ''         ");
       background-size: auto 100%;
      }
    '';
  programs.swaylock = {
    enable = true;
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
    waybar
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
