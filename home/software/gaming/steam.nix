{
  config,
  pkgs,
  lib,
  nixpkgs,
  inputs,
  home-manager,
  ...
}: {
  # Steam Support
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
}
