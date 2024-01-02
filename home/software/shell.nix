{
  pkgs,
  shell,
  ...
}: {
  imports = [
    ./shell/${shell}.nix
  ];

  users.defaultUserShell = pkgs.${shell};
}
