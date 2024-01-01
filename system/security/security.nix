{
  pkgs,
  lib,
  inputs,
  modules,
  modulesPath,
  ...
}: {
  imports = [
    ./doas.nix
    ./yubico.nix
  ];
}
