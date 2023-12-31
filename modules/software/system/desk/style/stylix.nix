{
  config,
  lib,
  username,
  pkgs,
  stylix,
  theme,
  themePath,
  font,
  fontPkg,
  home-manager,
  ...
}: {
   imports = [stylix.nixosModules.stylix];

  stylix.autoEnable = true;
  stylix.polarity = "dark";
  stylix.image = /home/${username}/Media/Wallpaper/wallhaven-mpmkp9.png;

  # stylix.base16Scheme = "./../../../../../themes/${theme}/${theme}.yaml";
  stylix.fonts = {
    monospace = {
      name = font;
      package = fontPkg;
    };
    serif = {
      name = font;
      package = fontPkg;
    };
    sansSerif = {
      name = font;
      package = fontPkg;
    };
    emoji = {
      name = "Noto Color Emoji";
      package = pkgs.noto-fonts-emoji-blob-bin;
    };
  };

  stylix.targets.lightdm.enable = true;
  services.xserver.displayManager.lightdm = {
    greeters.slick.enable = true;
    #    greeters.slick.theme.name = myLightDMTheme;
  };
  stylix.targets.console.enable = true;

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
