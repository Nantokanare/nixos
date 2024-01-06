{
  pkgs,
  inputs,
  firefox-addons,
  lib,
  config,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        FirefoxHome = {
          Search = true;
          Pocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
      floccus
      disconnect
    ];
    profiles = {
      default = {
        id = 0;
        name = "default";
        datareporting = {
          policy.dataSubmissionEnabled = false;
          healthreport.uploadEnabled = false;
        };
        search = {
          force = true;
          default = "DuckDuckGo";
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };
            "NixOS Wiki" = {
              urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = ["@nw"];
            };
            "Wikipedia (en)".metaData.alias = "@wiki";
            "Google".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
          };
        };
        settings = {
          "general.smoothScroll" = true;
        };
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
        extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("full-screen-api.ignore-widgets", true);
          user_pref("media.ffmpeg.vaapi.enabled", true);
          user_pref("media.rdd-vpx.enabled", true);
        '';
        userChrome = ''
          # a css
        '';
        userContent = ''
          # Here too
        '';
      };

      geo = {
        provider = {
          ms-windows-location = false;
          use_corelocation = false; # [MAC]
          use_gpsd = false; # [LINUX] [HIDDEN PREF]
          use_geoclue = false; # [FF102+] [LINUX]
        };
      };

      extensions = {
        quarantinedDomains.enabled = true; # [DEFAULT: true]
        htmlaboutaddons.recommendations.enabled = false;
        postDownloadThirdPartyPrompt = false;
        getAddons = {
          showPane = false; # [HIDDEN PREF]
        };
        blocklist = {
          enabled = true; # [DEFAULT: true]
        };
      };

      toolkit = {
        coverage.opt-out = true; # [FF64+] [HIDDEN PREF]
        telemetry = {
          coverage.opt-out = true; # [HIDDEN PREF]
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
      };
      privacy = {
        resistFingerprinting.letterboxing = true; # [HIDDEN PREF]
        firstparty.isolate = false; # [DEFAULT: false]
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
          cookies = false;
          cache = true; # [DEFAULT: true]
          formdata = true; # [DEFAULT: true]
          history = true; # [DEFAULT: true]
          sessions = true; # [DEFAULT: true]
          offlineApps = false; # [DEFAULT: false]
        };
        userContext = {
          enabled = true;
          ui = {
            enabled = true;
          };

          browser = {
            privatebrowsing.forceMediaMemoryCache = true; # [FF75+]
            shopping.experience2023.enabled = false; # [DEFAULT: false]
            display.use_system_colors = false; # [DEFAULT: false NON-WINDOWS]
            tabs.crashReporting.sendReport = false; # [FF44+]
            crashReports.unsubmittedCheck.autoSubmit2 = false; # [DEFAULT: false]
            link.open_newwindow = 3; # [DEFAULT: 3]
            contentblocking.category = "strict"; # [HIDDEN PREF]
            aboutConfig.showWarning = false;
            startup = {
              page = 0;
              homepage = "about:blank";
              homepage_override = {
                mstone = "ignore"; # [HIDDEN PREF]
              };
            };
            search = {
              separatePrivateDefault = {
                ui = {
                  enabled = true; # [FF71+]
                };
              };
              newtabpage = {
                enabled = false;
                activity-stream = {
                  default.sites = "";
                  telemetry = false;
                  showSponsored = false; # [FF58+] Pocket > Sponsored Stories
                  showSponsoredTopSites = false; # [FF83+] Sponsored shortcuts
                  feeds.telemetry = false;
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
              discovery.enabled = false;
              ping-centre = {
                telemetry = false;
              };
              urlbar = {
                pocket.featureGate = false; # [FF116+] [DEFAULT: false]
                mdn.featureGate = false; # [FF117+] [HIDDEN PREF]
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
                dns = {
                  skipTRR-when-parental-control-enabled = false;
                  disablePrefetch = true;
                };
                predictor = {
                  enable-prefetch = false; # [FF48+] [DEFAULT: false]
                  enabled = false;
                };
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

          security = {
            tls.version.enable-deprecated = false; # [DEFAULT: false]
            ssl = {
              dialog_enable_delay = 1000; # [DEFAULT: 1000]
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

          messaging-system = {
            whatsNewPanel = {
              enabled = false;
            };
          };
        };
      };

      weather = {
        featureGate = false; # [FF108+] [DEFAULT: false]
      };

      webcompat = {
        enable_shims = true; # [HIDDEN PREF] [DEFAULT: true]
        reporter = {
          enabled = false; # [DEFAULT: false]
        };
      };

      winRegisterApplicationRestart = false;

      widget = {
        non-native-theme = {
          enabled = true; # [DEFAULT: true]
        };
      };
    };
  };
}
