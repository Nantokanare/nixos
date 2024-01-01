{
  config,
  pkgs,
  home-manager,
  lib,
  ...
}: {
  imports = [
    ./cc/cc.nix
    ./rust/rust.nix
    # ./python/python.nix
  ];
}
