{hostname, ...}: {
  networking.hostName = "${hostname}";

  networking.networkmanager.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [7905];
  networking.firewall.allowedUDPPorts = [7905];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
}
