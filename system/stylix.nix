{
  stylix,
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
      desktop = 0.8;
      popups = 0.9;
    };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
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
      grub.useImage = true;
      nixvim.transparent_bg.main = true;
      nixvim.transparent_bg.sign_column = true;
    };
  };
}
