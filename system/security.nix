{
  pkgs,
  lib,
  inputs,
  modules,
  modulesPath,
  ...
}: {
  imports = [
    ./security/doas.nix
    ./security/yubico.nix
  ];
}
