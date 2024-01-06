{pkgs, ...}: {
  hardware.cpu.amd.updateMicrocode = true;

  programs.corectrl = {
    enable = true;
    gpuOverclock = {
      enable = true;
      ppfeaturemask = "0xffffffff";
    };
  };
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
