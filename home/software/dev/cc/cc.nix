{
  config,
  pkgs,
  home-manager,
  ...
}: {
  home.packages = with pkgs; [
    # CC
    gcc
    gnumake
    cmake
    autoconf
    automake
    libtool
  ];
}
