{
  pkgs,
  username,
  ...
}: {
  services = {
    mpd = {
      enable = true;
      #  dataDir = "/home/${username}/.config/mpd/dataDir";
      musicDirectory = "/home/${username}/media/music";
      network.startWhenNeeded = true;
      extraConfig = ''
              auto_update "yes"
                audio_output {
                  type "pipewire"
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
  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {visualizerSupport = true;};
  };
  home.packages = with pkgs; [
    mpd
    mpc-cli
    ncmpc
    mpdas
    mpdris2
    mympd
    listenbrainz-mpd
  ];
}
