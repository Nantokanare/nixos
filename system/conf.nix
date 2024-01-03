{
  config,
  pkgs,
  username,
  hostname,
  timezone,
  locale,
  extralocale,
  term,
  ...
}: {
  imports = [
    ./boot.nix
    ./hw.nix
    ./loc.nix
    ./net.nix
    ./security.nix
    ./software.nix
    ./user.nix
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
