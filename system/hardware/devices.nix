{...}: {
  # Enable EnvFS
  services.envfs.enable = true;

  # Fix USB sticks not mounting or being listed:
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Enable acpid
  services.acpid.enable = true;
  # Enable networking

  # XDG Desktop Portal stuff
  #  xdg.portal = {
  #    enable = true;
  #    extraPortals = with pkgs; [
  #      xdg-desktop-portal
  #      xdg-desktop-portal-gtk
  #    ];
  #  };

  # Printing support
  services.printing = {
    enable = true;
  };

  # KDEConnet
  programs.kdeconnect = {
    enable = true;
  };
  libinput = {
    touchpad.disableWhileTyping = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
