{
  pkgs,
  username,
  ...
}: {
  services = {
    mpd = {
      enable = true;
      dataDir = "/home/${username}/.config/mpd/dataDir";
      musicDirectory = "/home/${username}/media/music";
      extraConfig = ''
              auto_update "yes"
                audio_output {
                  type "alsa"
                  name "alsawire"
                }
        audio_output {
                  type "fifo"
                  name "ncmpcpp visualizer"
           path "/tmp/mpd.fifo"
           format "44100:16:1"
                }

      '';
    };
  };
  programs.ncmpcpp.enable = true;
  home.packages = with pkgs; [
    mpd
    mpdas
    mpdris2
    ncmpcpp
    mympd
    listenbrainz-mpd
  ];
}
