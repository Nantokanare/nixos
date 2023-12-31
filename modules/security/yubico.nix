{
  config,
  username,
  pkgs,
  lib,
  ...
}: {
  services.udev.packages = [pkgs.yubikey-personalization];

  services.yubikey-agent.enable = true;

  security.pam.yubico = {
    enable = true;
    control = "sufficient";
    mode = "challenge-response";
  };
}
