{
  pkgs,
  username,
  ...
}: {
  services = {
    ympd.enable = true;
    mpd = {
      enable = true;
      user = "${username}";
      dataDir = /home/${username}/.config/mpd/dataDir;
      musicDirectory = /home/${username}/media/music;
    };
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
