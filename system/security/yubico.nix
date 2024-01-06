{
  config,
  username,
  pkgs,
  lib,
  ...
}: {
  services.udev.packages = [pkgs.yubikey-personalization];

  services.yubikey-agent.enable = true;
  security.pam = {
    u2f.enable = true;
    yubico = {
      enable = true;
      control = "sufficient";
      mode = "challenge-response";
    };
  };
  environment.systemPackages = with pkgs; [
    libyubikey
    yubico-pam
    yubico-piv-tool
    yubihsm-connector
    yubihsm-shell
    yubikey-manager
    yubikey-personalization
    yubikey-touch-detector
    yubioath-flutter
    yubikey-agent
  ];
}
