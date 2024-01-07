{
  pkgs,
  shell,
  ...
}: {
  imports = [
    ./shells/${shell}.nix
  ];

  users.defaultUserShell = pkgs.${shell};
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
