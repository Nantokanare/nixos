{pkgs, ...}: {
  # Enable EnvFS
  services = {
    #  brltty.enable = true;
    printing.enable = true;
    envfs.enable = true;

    devmon.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;

    acpid.enable = true;
    # neard.enable = true;

    xserver.libinput = {
      touchpad.disableWhileTyping = true;
    };
  };
  environment.systemPackages = with pkgs; [
    usbutils
    screen
    proxmark3
    libnfc
    ifdnfc
  ];
  # KDEConnet
  programs = {
    usbtop.enable = true;
    kdeconnect = {
      enable = true;
    };
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
