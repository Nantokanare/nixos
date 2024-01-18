{
  pkgs,
  username,
  ...
}: {
  services = {
    mpd = {
      enable = true;
      #   dataDir = "/home/${username}/.config/mpd/dataDir";
      #    musicDirectory = "/home/${username}/media/music";
      #     extraConfig = ''
      #       audio_output {
      #         type "pipewire"
      #         name "pipewireOut"
      #       }
      #     '';
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
