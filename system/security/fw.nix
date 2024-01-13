{pkgs, ...}: {
  services.opensnitch.enable = true;
  networking.firewall = {
    allowedTCPPorts = [7905];
    allowedUDPPorts = [7905];
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    opensnitch-ui
    opensnitch
  ];
}
