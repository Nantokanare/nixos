{
  pkgs,
  lib,
  inputs,
  modules,
  modulesPath,
  ...
}: {
  imports = [
    ./gaming/steam.nix
  ];
}
