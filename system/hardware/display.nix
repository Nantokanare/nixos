{
  pkgs,
  username,
  wm,
  ...
}: {
  imports = [
    ./../software/wm/${wm}.nix
  ];
  hardware.opengl.enable = true;

  services.picom = {
    enable = true;
    vSync = true;
    inactiveOpacity = 0.6;
  };
}
