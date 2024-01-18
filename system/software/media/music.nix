{
  pkgs,
  username,
  ...
}: {
  services = {
    ympd.enable = true;
    mpd = {
      enable = true;
      dataDir = /home/${username}/media/music/dataDir;
      musicDirectory = /home/${username}/media/music;
    };
    mpdscribble.enable = true;
  };
  environment.systemPackages = with pkgs; [
    mpd
    mpdas
    mpdris2
    ncmpcpp
    mympd
    listenbrainz-mpd
  ];
}
