{
  config,
  username,
  pkgs,
  ...
}: {
  imports = [
  ];

  # Enable automatic login for the user.
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    enable = true;
    excludePackages = [pkgs.xterm];
    displayManager = {
      lightdm.enable = true;
      autoLogin = {
        enable = true;
        user = "${username}";
      };
    };
  };
  services.picom = {
    enable = true;
    vSync = true;
    inactiveOpacity = 0.6;
  };
}
