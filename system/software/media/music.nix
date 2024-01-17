{
  pkgs,
  username,
  ...
}: {
  services.mpd = {
    enable = true;
    musicDirectory = /home/${username}/media/music;
  };
  environment.systemPackages = with pkgs; [
    mpd
    mpdas
    listenbrainz-mpd
  ];
}
