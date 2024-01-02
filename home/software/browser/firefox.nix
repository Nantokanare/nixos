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

      extensions = {
        htmlaboutaddons.recommendations.enabled = false;
        postDownloadThirdPartyPrompt = false;
        getAddons = {
          showPane = false; # [HIDDEN PREF]
        };
        blocklist = {
          enabled = true; # [DEFAULT: true]
        };
      };

      datareporting = {
        policy.dataSubmissionEnabled = false;
        healthreport.uploadEnabled = false;
      };

      toolkit = {
        telemetry = {
          enabled = false;
          unified = false;
          server = "null";
          archive.enabled = false;
          endpoint.base = "";
          winRegisterApplicationRestart = false;
          archive = {
          };
        };
        newProfilePing = {
          enabled = false; # [FF55+]
        };
        shutdownPingSender = {
          enabled = false; # [FF55+]
        };
        updatePing = {
          enabled = false; # [FF56+]
        };
        bhrPing = {
          enabled = false; # [FF57+] Background Hang Reporter
        };
        firstShutdownPing = {
          enabled = false; # [FF57+]
        };
        coverage = {
          opt-out = true; # [HIDDEN PREF]
        };
      };
      privacy = {
        userContext = {
          enabled = true;
          ui = {
            enabled = true;
          };
          userContext = {
            enabled = true;
            ui = {
              enabled = true;
            };
          };

          browser = {
            link = {
              open_newwindow = 3; # [DEFAULT: 3]
            };
            aboutConfig.showWarning = false;
            startup.page = 0;
            startup.homepage = "about:blank";
            newtabpage.enabled = false;
            newtabpage.activity-stream.default.sites = "";
            discovery.enabled = false;
            ping-centre = {
              telemetry = false;
            };
            urlbar = {
              speculativeConnect.enabled = false;
              trending.featureGate = false;
              showSearchTerms.enabled = false;
              suggest = {
                enabled = false;
                searches = false;
                quicksuggest = {
                  nonsponsored = false; # [FF95+]
                  sponsored = false; # [FF92+]
                };
              };
            };
            xul = {
              error_pages.expert_bad_cert = true;
            };
            sessionstore = {
              privacy_level = 2;
            };
            shell = {
              shortcutFavicons = false;
            };
            helperApps = {
              deleteTempFileOnExit = true;
            };

            newtabpage = {
              activity-stream = {
                telemetry = false;
                showSponsored = false; # [FF58+] Pocket > Sponsored Stories
                showSponsoredTopSites = false; # [FF83+] Sponsored shortcuts
                feeds.telemetry = false;
              };
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
              auth = {
                subresource-http-auth-allow = 1;
              };
              http = {
                referer = {
                  spoofSource = false; # [DEFAULT: false]
                  XOriginTrimmingPolicy = 2;
                };
              };

              captive-portal-service = {
                enabled = false; # [FF52+]
              };

              file = {
                disable_unc_paths = true; # [HIDDEN PREF]
              };

              gio = {
                supported-protocols = ""; # [HIDDEN PREF] [DEFAULT: "" FF118+]
              };

              dns = {
                skipTRR-when-parental-control-enabled = false;
              };
            };
          };

          signon = {
            autofillForms = false;
            formlessCapture.enabled = false;
          };

          formfill.enable = false;
          cache.disk.enable = false;
        };

        media = {
          memory_cache_max_size = 65536;
          peerconnection = {
            ice = {
              proxy_only_if_behind_proxy = true;
              default_address_only = true;
            };
          };
        };

        security.ssl = {
          require_safe_negotiation = true;
          enable_0rtt_data = false;
          treat_unsafe_negotiation_as_broken = true;
          OCSP = {
            require = true;
          };

          cert_pinning = {
            enforcement_level = 2;
          };

          remote_settings = {
            crlite_filters.enabled = true;
          };

          pki = {
            crlite_mode = 2;
          };
          family_safety = {
            mode = 0;
          };
          OCSP = {
            enabled = 1; # [DEFAULT: 1]
          };
        };

        sanitize = {
          sanitizeOnShutdown = true;
          timeSpan = 0;
        };

        cpd = {
          cookies = false;
        };
      };

      dom = {
        disable_window_move_resize = true;
      };

      uitour = {
        enabled = false;
      };

      permissions = {
        manager = {
          defaultsUrl = "";
        };
      };

      webchannel = {
        allowObject = {
          urlWhitelist = "";
        };
      };

      IDN_show_punycode = true;

      download = {
        useDownloadDir = false;
        alwaysOpenPanel = false;
        manager = {
          addToRecentDocs = false;
          always_ask_before_handling_new_types = true;
        };
      };

      link = {
        open_newwindow = {
          restriction = 0;
        };
      };

      newtabpage = {
        activity-stream = {
          asrouter = {
            userprefs = {
              cfr = {
                addons = false;
                features = false;
              };
            };
          };
        };
      };

      messaging-system = {
        whatsNewPanel = {
          enabled = false;
        };
      };
    };

    dns = {
      skipTRR-when-parental-control-enabled = false;
    };
  };

  helperApps = {
    deleteTempFileOnExit = true;
  };

  shopping = {
    experience2023 = {
      enabled = false; # [DEFAULT: false]
    };
  };

  tabs = {
    crashReporting = {
      sendReport = false; # [FF44+]
    };
  };

  crashReports = {
    unsubmittedCheck = {
      autoSubmit2 = false; # [DEFAULT: false]
    };
  };

  captive-portal-service = {
    enabled = false; # [FF52+]
  };

  predictor = {
    enable-prefetch = false; # [FF48+] [DEFAULT: false]
  };

  mdn = {
    featureGate = false; # [FF117+] [HIDDEN PREF]
  };

  pocket = {
    featureGate = false; # [FF116+] [DEFAULT: false]
  };

  weather = {
    featureGate = false; # [FF108+] [DEFAULT: false]
  };

  search = {
    separatePrivateDefault = true; # [FF70+]
  };

  separatePrivateDefault = {
    ui = {
      enabled = true; # [FF71+]
    };
  };

  privatebrowsing = {
    forceMediaMemoryCache = true; # [FF75+]
  };

  contentblocking = {
    category = "strict"; # [HIDDEN PREF]
  };

  startup = {
    homepage_override = {
      mstone = "ignore"; # [HIDDEN PREF]
    };
  };

  htmlaboutaddons = {
    recommendations = {
      enabled = false;
    };
  };

  webcompat = {
    enable_shims = true; # [HIDDEN PREF] [DEFAULT: true]
    reporter = {
      enabled = false; # [DEFAULT: false]
    };
  };

  quarantinedDomains = {
    enabled = true; # [DEFAULT: true]
  };

  firstparty = {
    isolate = false; # [DEFAULT: false]
  };

  resistFingerprinting = {
    letterboxing = true; # [HIDDEN PREF]
  };

  clearOnShutdown = {
    cache = true; # [DEFAULT: true]
    downloads = true; # [DEFAULT: true]
    formdata = true; # [DEFAULT: true]
    history = true; # [DEFAULT: true]
    sessions = true; # [DEFAULT: true]
    cookies = true; # Cookies
    offlineApps = true; # Site Data
  };

  cpd = {
    cache = true; # [DEFAULT: true]
    formdata = true; # [DEFAULT: true]
    history = true; # [DEFAULT: true]
    sessions = true; # [DEFAULT: true]
    offlineApps = false; # [DEFAULT: false]
  };

  coverage = {
    opt-out = true; # [FF64+] [HIDDEN PREF]
  };

  winRegisterApplicationRestart = false;

  dialog_enable_delay = 1000; # [DEFAULT: 1000]

  tls = {
    version = {
      enable-deprecated = false; # [DEFAULT: false]
    };
  };

  widget = {
    non-native-theme = {
      enabled = true; # [DEFAULT: true]
    };
  };

  pdfjs = {
    disabled = false; # [DEFAULT: false]
    enableScripting = false; # [FF86+]
  };

  display = {
    use_system_colors = false; # [DEFAULT: false NON-WINDOWS]
  };
}
