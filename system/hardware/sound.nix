{pkgs, ...}: {
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services = {
    jack = {
      # jackd.enable = true;
      loopback.enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack = {
        enable = true;
      };
      wireplumber.enable = true;
    };
  };
  sound.mediaKeys.enable = true;
  environment.systemPackages = with pkgs; [
    helvum
    jamesdsp
  ];
}
