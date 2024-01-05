{
  stylix,
  wmtype,
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  stylix = {
    autoEnable = true;
    polarity = "dark";
    image = ./../themes/walls/2.png;
    opacity = {
      terminal = 0.7;
      applications = 0.9;
      desktop = 0.8;
      popups = 0.9;
    };
    fonts = {
      serif = {
        package = pkgs.jost;
        name = "Jost";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    targets = {
      gnome.enable = true;
      # grub.useImage = true;
      nixvim.transparent_bg.main = true;
      nixvim.transparent_bg.sign_column = true;
      alacritty.enable = true;
      kitty.enable = true;
      gtk.enable = true;
      #  plymouth = {
      #    enable = true;
      #    blackBackground = true;
      #    #      logo =
      #    #      logoAnimated =
      #  };
      rofi.enable =
        if (wmtype == "x11")
        then true
        else false;
      feh.enable =
        if (wmtype == "x11")
        then true
        else false;
    };
  };
  programs.feh.enable = true;
  home.file.".fehbg-stylix".text =
    ''
      #!/bin/sh
      feh --no-fehbg --bg-fill ''
    + config.stylix.image
    + ''      ;
    '';
  home.file.".fehbg-stylix".executable = true;
  home.file.".swaybg-stylix".text =
    ''
      #!/bin/sh
      swaybg -m fill -i ''
    + config.stylix.image
    + ''      ;
    '';
  home.file.".swaybg-stylix".executable = true;
  # TODO add stylix colors to swaylock cmd
  home.file.".swayidle-stylix".text = ''
    #!/bin/sh
    swaylock_cmd='swaylock --indicator-radius 200 --screenshots --effect-blur 10x10'
    swayidle -w timeout 300 "$swaylock_cmd --fade-in 0.5 --grace 5" \
    #            timeout 600 'hyprctl dispatch dpms off' \
    #            resume 'hyprctl dispatch dpms on' \
                before-sleep "$swaylock_cmd"
  '';
  home.file.".swayidle-stylix".executable = true;
}
