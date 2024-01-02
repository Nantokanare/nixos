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
      browser = {
        aboutConfig.showWarning = false;
        startup.page = 0;
        startup.homepage = "about:blank";
        newtabpage.enabled = false;
        newtabpage.activity-stream.default.sites = "";
        discovery.enabled = false;
      };

      extensions = {
        htmlaboutaddons.recommendations.enabled = false;
      };

      datareporting = {
        policy.dataSubmissionEnabled = false;
        healthreport.uploadEnabled = false;
      };

      toolkit = {
        telemetry.unified = false;
        telemetry.server = "data:,";
        telemetry.archive.enabled = false;
        coverage.endpoint.base = "";
        winRegisterApplicationRestart = false;
      };

      browser.ping-centre = {
        telemetry = false;
      };

      browser.newtabpage.activity-stream.feeds = {
        telemetry = false;
      };

      browser.newtabpage.activity-stream = {
        telemetry = false;
      };

      app = {
        shield.optoutstudies.enabled = false;
        normandy.enabled = false;
        normandy.api_url = "";
      };

      breakpad = {
        reportURL = "";
      };

      captivedetect = {
        canonicalURL = "";
      };

      network = {
        connectivity-service.enabled = false;
        safebrowsing.downloads.remote.enabled = false;
        prefetch-next = false;
        dns.disablePrefetch = true;
        predictor.enabled = false;
        http.speculative-parallel-limit = 0;
        proxy.socks_remote_dns = true;
      };

      browser.urlbar = {
        speculativeConnect.enabled = false;
        suggest.enabled = false;
        suggest.searches = false;
        trending.featureGate = false;
      };

      browser.formfill = {
        enable = false;
      };

      signon = {
        autofillForms = false;
        formlessCapture.enabled = false;
      };

      network.auth = {
        subresource-http-auth-allow = 1;
      };

      browser.cache.disk = {
        enable = false;
      };

      media = {
        memory_cache_max_size = 65536;
      };

      browser.sessionstore = {
        privacy_level = 2;
      };

      browser.shell = {
        shortcutFavicons = false;
      };

      security.ssl = {
        require_safe_negotiation = true;
        enable_0rtt_data = false;
        treat_unsafe_negotiation_as_broken = true;
      };

      security.OCSP = {
        require = true;
      };

      security.cert_pinning = {
        enforcement_level = 2;
      };

      security.remote_settings = {
        crlite_filters.enabled = true;
      };

      security.pki = {
        crlite_mode = 2;
      };

      browser.xul = {
        error_pages.expert_bad_cert = true;
      };
    };
  };
}
