{pkgs, ...}: {
  imports = [
    ./../x11.nix
  ];

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
}
