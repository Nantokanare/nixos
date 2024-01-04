{
  config,
  pkgs,
  lib,
  home-manager,
  ...
}: {
  home.packages = with pkgs; [
    # Python setup
    python3Full
    imath
    pystring
  ];
  programs.pylint.enable = true;
}
