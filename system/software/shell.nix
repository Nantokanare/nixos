{
  pkgs,
  shell,
  ...
}: {
  imports = [
    ./shell/${shell}.nix
    #    ./zsh.nix
  ];

  users.defaultUserShell = pkgs.${shell};
}
