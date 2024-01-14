{pkgs, ...}: {
  virtualisation = {
    # cores = 8;
    podman.enable = true;
    # anbox.enable = true;
    waydroid.enable = true;
    libvirtd.enable = true;
  };
  environment.systemPackages = with pkgs; [
    virtualboxHardened
    virtualboxExtpack
    anbox
    waydroid
    qemu
  ];
}
