{
  config,
  username,
  pkgs,
  ...
}: {
  imports = [
    ./pipewire.nix
    ./dbus.nix
    ./gnome-keyring.nix
    ./fonts.nix
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
}
