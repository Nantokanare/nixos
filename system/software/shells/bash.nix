{
  pkgs,
  shell,
  ...
}: {
  programs.${shell} = {
    enable = true;
    shellAliases = import ./alias.nix;
  };
}
