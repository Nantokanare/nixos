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

  services.picom = {
    enable = true;
    vSync = true;
    inactiveOpacity = 0.6;
  };
  programs.light.enable = true;
}
