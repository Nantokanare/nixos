{
  config,
  pkgs,
  home-manager,
  lib,
  ...
}: {
  imports = [
    ./dev/cc/cc.nix
    ./dev/rust/rust.nix
    # ./python/python.nix
  ];
}