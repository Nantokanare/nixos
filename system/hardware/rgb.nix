{pkgs, ...}: {
  services.udev.packages = [pkgs.openrgb];
  # OpenRGB
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };
}