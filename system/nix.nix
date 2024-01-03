{pkgs, ...}: {
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];

    nixPath = [
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
      #     "nixos-config=$HOME/dotfiles/system/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];

    # Ensure nix flakes are enabled
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  # I'm sorry Stallman-taichou
  nixpkgs.config.allowUnfree = true;
}
