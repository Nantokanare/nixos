{pkgs, ...}: {
  hardware.keyboard.zsa.enable = true;
  environment.systemPackages = with pkgs; [
    zsa-udev-rules
    wally-cli
  ];
}
