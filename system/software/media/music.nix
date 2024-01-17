{pkgs, ...}: {
  services.mpd = {
    enable = true;
    musicDirectory = ~/media/music;
  };
  environment.systemPackages = with pkgs; [
    mpd
    mpdas
    listenbrainz-mpd
  ];
}
