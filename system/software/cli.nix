{pkgs, ...}: {
  imports = [
    ./cli/starship.nix
  ];
  services.atuin.enable = true;
  environment.systemPackages = with pkgs; [
    atuin
    starship
  ];
}
