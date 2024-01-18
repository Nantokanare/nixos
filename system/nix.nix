{pkgs, ...}: {
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];

    nixPath = [
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
      "nixos-config=$HOME/nix/flakesFromScratch/R9/system/conf.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];

    # Ensure nix flakes are enabled
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.crossSystem = {};
}
