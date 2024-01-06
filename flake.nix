{
  description = "Flake from scratch";

  outputs = inputs @ {
    self,
    nixpkgs,
    nur,
    home-manager,
    stylix,
    firefox-addons,
    ...
  }: let
    # ---- SYSTEM SETTINGS ---- #
    system = "x86_64-linux"; # system arch
    systemtype = "desk";
    hostname = "R9";
    # profile = "personal"; # select a profile defined from my profiles directory
    timezone = "Europe/Amsterdam"; # select timezone
    locale = "en_US.UTF-8"; # select locale
    extralocale = "nl_NL.UTF-8";

    # ----- USER SETTINGS ----- #
    username = "nantokanare";
    name = "Nantokanare";
    email = "nix@nantokanare.nl";
    shell = "zsh";
    # dotfilesDir = "~/.dotfile"; # absolute path of the local repo
    theme = "6"; # selcted theme from my themes directory (./themes/)
    wm = "i3"; # desktop environment; must select one in both ./home/wm/ and ./system/wm/
    wmtype = "x11"; # x11 or wayland
    browser = "librewolf"; # Default browser; must select one from
    editor = "nvim"; # Default editor;
    term = "kitty"; # Default terminal command;
    font = "Monofur"; # Selected font
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
          # inherit dotfilesDir;
          # inherit profile;
          inherit theme;
          inherit (inputs) stylix;
          inherit browser;
          inherit editor;
          inherit email;
          inherit font;
          inherit fontPkg;
          inherit hostname;
          inherit name;
          inherit shell;
          inherit term;
          inherit timezone;
          inherit username;
          inherit wm;
          inherit wmtype;
        };
      };
    };
    nixosConfigurations = {
      ${hostname} = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/conf.nix
          stylix.nixosModules.stylix
          nur.nixosModules.nur
        ];
        specialArgs = {
          # inherit dotfilesDir;
          # inherit profile;
          inherit theme;
          inherit (inputs) stylix;
          inherit browser;
          inherit editor;
          inherit email;
          inherit extralocale;
          inherit font;
          inherit fontPkg;
          inherit hostname;
          inherit inputs;
          inherit locale;
          inherit name;
          inherit shell;
          inherit systemtype;
          inherit term;
          inherit timezone;
          inherit username;
          inherit wm;
          inherit wmtype;
        };
      };
    };
  };
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    base16.url = "github:SenchoPens/base16.nix";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
