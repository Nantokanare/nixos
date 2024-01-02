{
  pkgs,
  username,
  ...
}: {
  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "${username}";
  };
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Cinnamon Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      basez
      base16-schemes
      dmenu
      i3status-rust
      i3lock
      i3-resurrect
      i3nator
      i3-ratiosplit
      pulseaudioFull
      nitrogen
      picom
    ];
  };
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  hardware.opengl.enable = true;

  services.picom = {
    enable = true;
    vSync = true;
  };
}
