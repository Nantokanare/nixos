{pkgs, ...}: {
  services.opensnitch.enable = true;
  networking.firewall = {
    allowedTCPPorts = [7905 6600];
    allowedUDPPorts = [7905 6600];
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    opensnitch-ui
    opensnitch
  ];
}
