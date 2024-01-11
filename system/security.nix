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
    ./security/gnupg.nix
    ./security/ssh.nix
  ];
  environment.systemPackages = [
    pkgs.age
  ];
}
