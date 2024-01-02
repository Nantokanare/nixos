{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      bookmarks = [
        {
          name = "wikipedia";
          tags = ["wiki"];
          keyword = "wiki";
          url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        }
        {
          name = "kernel.org";
          url = "https://www.kernel.org";
        }
        {
          name = "Nix sites";
          toolbar = true;
          bookmarks = [
            {
              name = "homepage";
              url = "https://nixos.org/";
            }
            {
              name = "wiki";
              tags = ["wiki" "nix"];
              url = "https://nixos.wiki/";
            }
          ];
        }
      ];
    };
    policies = {
      BlockAboutConfig = true;
      DefaultDownloadDirectory = "\${home}/Downloads";

      geo = {
        provider = {
          ms-windows-location = false;
          use_corelocation = false; # [MAC]
          use_gpsd = false; # [LINUX] [HIDDEN PREF]
          use_geoclue = false; # [FF102+] [LINUX]
        };
      };
    };
  };
}
