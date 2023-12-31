{
  description = "Flake from scratch";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    # ---- SYSTEM SETTINGS ---- #
    system = "x86_64-linux"; # system arch
    systemtype = "desk";
    hostname = "R9";
    profile = "personal"; # select a profile defined from my profiles directory
    timezone = "Europe/Amsterdam"; # select timezone
    locale = "en_US.UTF-8"; # select locale
    extralocale = "nl_NL.UTF-8";

    # ----- USER SETTINGS ----- #
    username = "nantokanare";
    name = "Nantokanare"; # name/identifier
    email = "nix@nantokanare.nl"; # email (used for certain configurations)
    shell = "fish";
    dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
    theme = "xcode-dusk"; # selcted theme from my themes directory (./themes/)
    wm = "sway"; # desktop environment; must select one in both ./user/wm/ and ./system/wm/
    wmtype = "wayland"; # x11 or wayland
    browser = "firefox"; # Default browser; must select one from ./user/app/browser/
    editor = "nvim"; # Default editor;
    term = "alacritty"; # Default terminal command;
    font = "Intel One Mono"; # Selected font
    fontPkg = pkgs.intel-one-mono; # Font package

    # -----
    pkgs = nixpkgs.legacyPackages.${system};

    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      ${hostname} = lib.nixosSystem {
        inherit system;
        modules = [
          ./conf.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = {
                home = {
                  username = username;
                  homeDirectory = "/home/${username}";
                  stateVersion = "23.11";
                };
              };
            };
            programs.home-manager.enable = true;
          }
        ];
        specialArgs = {
          inherit browser;
          inherit dotfilesDir;
          inherit editor;
          inherit email;
          inherit extralocale;
          inherit font;
          inherit fontPkg;
          inherit hostname;
          inherit locale;
          inherit name;
          inherit profile;
          inherit shell;
          inherit systemtype;
          inherit term;
          inherit theme;
          inherit timezone;
          inherit username;
          inherit wm;
          inherit wmtype;
        };
      };
    };

    inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager/master";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  };
}
