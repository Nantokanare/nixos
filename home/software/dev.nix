{
  config,
  pkgs,
  home-manager,
  lib,
  ...
}: {
  imports = [
    ./dev/cc/cc.nix
    ./dev/android/android.nix
    ./dev/rust/rust.nix
    ./dev/python/python.nix
  ];
}
