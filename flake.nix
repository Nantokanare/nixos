{
  description = "Flake from scratch";

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    stylix,
    ...
  }: let
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
    browser = "librewolf"; # Default browser; must select one from ./user/app/browser/
    editor = "nvim"; # Default editor;
    term = "kitty"; # Default terminal command;
    font = "MonofurNerdFont"; # Selected font
    fontPkg = pkgs.nerdfonts; # Font package

    # -----
    pkgs = nixpkgs.legacyPackages.${system};

    lib = nixpkgs.lib;
  in {
    homeConfigurations = {
      ${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/home.nix
          stylix.homeManagerModules.stylix
        ];
        extraSpecialArgs = {
          # pass config variables from above
          inherit username;
          inherit name;
          inherit hostname;
          inherit profile;
          inherit email;
          inherit timezone;
          inherit dotfilesDir;
          inherit theme;
          inherit font;
          inherit fontPkg;
          inherit wm;
          inherit shell;
          inherit wmtype;
          inherit browser;
          inherit editor;
          inherit term;
          inherit stylix;
        };
      };
    };
    nixosConfigurations = {
      ${hostname} = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/conf.nix
          stylix.nixosModules.stylix
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
          inherit stylix;
        };
      };
    };

    inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable";
      stylix.url = "github:danth/stylix";

      home-manager = {
        url = "github:nix-community/home-manager/master";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  };
}
