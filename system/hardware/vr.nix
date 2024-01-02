{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    immersed-vr
    openhmd
    vrpn
    openvr
    lighthouse-steamvr
  ];
}
