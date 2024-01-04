{
  pkgs,
  config,
  ...
}: {
  boot = {
    kernel.sysctl."kernel.sysrq" = 1;
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [
      zenpower
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelModules = ["i2c-dev" "kvm-amd" "ic2-piix4"];
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = ["amdgpu"];
      luks.devices."luks-1e1fa6cd-5fc0-4423-992b-6ce901f7432f".device = "/dev/disk/by-uuid/1e1fa6cd-5fc0-4423-992b-6ce901f7432f";
    };

    plymouth = {
      enable = true;
      #theme = "bgrt";
    };
  };
}
