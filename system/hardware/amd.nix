{pkgs, ...}: {
  boot.initrd.kernelModules = ["amdgpu"];

  hardware.cpu.amd.updateMicrocode = true;

  programs.corectrl.enable = true;

  environment.systemPackages = with pkgs; [
    amd-blis
    amdctl
    amdgpu_top
    amdvlk
    aocl-utils
    corectrl
    microcodeAmd
    zenmonitor
  ];
}
