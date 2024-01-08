{
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
    package = "${pkgs.swayfx}";
    systemd.enable = true;
    config = {
      modifier = "Mod4";
      startup = [
        {
          command = "systemctl --user restart waybar";
          always = true;
        }
        {command = "${browser}";}
      ];
    };
  };
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    ".config/sway/config;".source = ./../../dotfiles/sway/config;

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
    i3blocks
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
#   config = {
#     # bars = ["\${pkgs.waybar}/bin/waybar"];
#     terminal = "kitty";
#     modifier = "Mod4";
#     floating.modifier = "Mod4";
#     assigns = {
#       "2" = [
#         {app_id = "^firefox$";}
#         {class = "^firefox$";}
#       ];
#     };
#     floating.criteria = [
#       {app_id = "^tmenu|mpv$";}
#     ];
#     window.commands = [
#       {
#         command = "inhibit_idle fullscreen";
#         criteria = {app_id = ''^info\.cemu\.Cemu$'';};
#       }
#       {
#         command = "inhibit_idle fullscreen";
#         criteria = {class = ''^yuzu$'';};
#       }
#     ];
#     # Border
#     floating.titlebar = false;
#     gaps = {
#       top = 4;
#       bottom = 4;
#       horizontal = 4;
#       vertical = 4;
#       inner = 4;
#       outer = 4;
#       left = 4;
#       right = 4;
#       smartBorders = "on";
#       smartGaps = true;
#     };
#     window = {
#       border = 1;
#       hideEdgeBorders = "both";
#       titlebar = false;
#     };
#     # Colors
#     # Keybindings
#     menu = "fuzzel";
#     #          keybindings = let mod = config.wayland.windowManager.sway.config.modifier; in lib.mkOptionDefault {
#     #            "${mod}+Tab" = "workspace back_and_forth";
#     #            # stop graphical-session.target so services like foot will not try to restart itself
#     #            "${mod}+Shift+e" = mkIf config.wayland.windowManager.sway.systemd.enable "exec swaynag -t warning -m 'Do you really want to exit sway?' -b 'Yes, exit sway' 'systemctl --user stop graphical-session.target; swaymsg exit'";
#     #            "${mod}+Shift+p" = "exec ${cfg.tmenu} passfzf";
#     #            "${mod}+c" = "floating toggle; resize set 75 ppt 75 ppt; move absolute position center";
#     #            "--release --no-repeat ${mod}+Escape" = mkDefault "exec swaylock";
#     #            "Print" = "grimshot save - | swappy -f -";
#     #            "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
#     #            "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
#     #            "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
#     #          };
#     # Inputs/outputs
#     input = {
#       "type:keyboard" = {
#         repeat_delay = "300";
#         repeat_rate = "33";
#       };
#       "type:touchpad" = {
#         drag_lock = "enabled";
#         dwt = "enabled";
#         tap = "enabled";
#         scroll_factor = "0.6";
#       };
#       # "<touchpad>" = {
#       #   accel_profile = "adaptive";
#       #   natural_scroll = "enabled";
#       #   pointer_accel = "0.28";
#       #   scroll_method = "edge";
#       # };
#     };
#   };
#   swaynag = {
#     enable = true;
#     settings."<config>".edge = "bottom";
#   };
# };
#  wayland.windowManager.sway = {
#    enable = true;
#      keycodebindings = {
#        "213" = "exec pamixer --increase 5";
#      };
#      assigns = {
#        "1: web" = [{class = "^Firefox$";}];
#        "0: extra" = [
#          {
#            class = "^Firefox$";
#            window_role = "About";
#          }
#        ];
#      };
#      #  keybindings = {
#      #    "XF86AudioRaiseVolume" = v	"exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
#      #    "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% ";
#      #    "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
#      #    #    "XF86AudioMicMute" = "exec volumectl -m toggle-mute";
#      #  };
#    };
#  };
# }
