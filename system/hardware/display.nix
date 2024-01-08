{
  pkgs,
  username,
  wm,
  wmtype,
  ...
}: {
  imports = [
    ./../software/${wmtype}/${wm}.nix
  ];
  hardware.opengl.enable = true;

  programs.light.enable = true;
}
