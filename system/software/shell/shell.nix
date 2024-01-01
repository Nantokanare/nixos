{
  pkgs,
  shell,
  ...
}: {
  imports = [
    ./bash.nix
    ./fish.nix
    #    ./zsh.nix
  ];

  users.defaultUserShell = pkgs.${shell};
}
