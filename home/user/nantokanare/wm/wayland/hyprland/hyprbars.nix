{
  pkgs,
  lib,
  inputs,
  hyprland,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
    ];
  };
}
# ...
#  hyprland-plugins.packages = [
#    inputs.hyprland-plugins.packages.hyprbars
#    # ...
#  ];
#}
# {
#   config,
#   inputs,
#   system,
#   lib,
#   stdenv,
#   home-manager,
#   pkgs,
#   hyprland,
#   hyprland-plugins,
#   ...
# }: {
#   wayland.windowManager.hyprland = {
#     enable = true;
#     plugins = [
#       # ...
#       # ...
#     ];
#   };
#
#   # stdenv.mkDerivation rec {
#   #   pname = "hyprbars";
#   #   version = "unstable";
#   #   src = "${hyprland-plugins}/hyprbars";
#   #   nativeBuildInputs = [pkgs.hyprland.nativeBuildInputs];
#   #   buildInputs = [pkgs.hyprland pkgs.hyprland.buildInputs];
#   #   meta = {
#   #     homepage = "https://gitlab.com/phoneybadger/pokemon-colorscripts";
#   #     description = "CLI utility to print out images of pokemon to terminal";
#   #     license = lib.licenses.mit;
#   #     maintainers = [];
#   #   };
# }
