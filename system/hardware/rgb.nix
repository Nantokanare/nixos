{pkgs, ...}: {
  boot.kernelModules = ["i2c-dev" "ic2-piix4"];
  hardware.i2c = {
    enable = true;
    group = "users";
  };
  services.udev.packages = [pkgs.openrgb];
  # OpenRGB
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };
  environment.systemPackages = with pkgs; [
    i2c-tools
  ];
}
