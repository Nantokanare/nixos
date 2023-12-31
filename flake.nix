{
  description = "Flake from scratch";

  inputs = {
		nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
        home-manager = {
          url = "github:nix-community/home-manager/master";
          inputs.nixpkgs.follows = "nixpkgs";
      };


  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.R9 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./conf.nix ];
    };
  };
  };
}
