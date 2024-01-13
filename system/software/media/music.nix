{pkgs, ...}: {
  services.mpd.enable = true;
  environment.systemPackages = with pkgs; [
    mpd
    mpdas
    listenbrainz-mpd
  ];
}
