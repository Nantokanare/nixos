{
  config,
  pkgs,
  ...
}: {
  services = {
    upower.enable = true;
    dbus = {
      implementation = "broker";
      enable = true;
      apparmor = "enabled";
      packages = [pkgs.dconf];
    };
  };

  programs.dconf = {
    enable = true;
  };
}
