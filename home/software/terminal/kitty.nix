{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    kitty
  ];
  programs = {
    kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      settings = {
        background_opacity = lib.mkForce "0.65";
      };
    };
  };
}
