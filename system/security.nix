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
    ./security/fw.nix
    ./security/yubico.nix
    ./security/gnupg.nix
  ];
  environment.systemPackages = [
    pkgs.age
  ];
}
