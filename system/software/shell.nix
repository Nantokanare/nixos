{
  pkgs,
  shell,
  ...
}: {
  imports = [
    ./shell/${shell}.nix
    ./cli.nix
  ];

  users.defaultUserShell = pkgs.${shell};
}
