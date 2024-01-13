{hostname, ...}: {
  networking.hostName = "${hostname}";

  networking.networkmanager.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
}
