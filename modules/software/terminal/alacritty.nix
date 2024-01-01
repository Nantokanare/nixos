{
  config,
  pkgs,
  lib,
  home-manager,
  ...
}: {
  programs.alacritty = {
		  enable = true;
          settings = {
    window.opacity = lib.mkForce 0.65;
  };
  };
}
