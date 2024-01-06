{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nushellFull
    nushellPlugins.gstat
    nushellPlugins.formats
    nushellPlugins.regex
    nushellPlugins.net
  ];
}
