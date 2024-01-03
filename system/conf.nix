{
  config,
  extralocale,
  hostname,
  locale,
  pkgs,
  stylix,
  term,
  timezone,
  username,
  ...
}: {
  imports = [
    ./boot.nix
    ./hw.nix
    ./loc.nix
    ./net.nix
    ./nix.nix
    ./security.nix
    ./software.nix
    ./stylix.nix
    ./user.nix
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
