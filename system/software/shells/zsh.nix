{
  pkgs,
  shell,
  ...
}: {
  programs.${shell} = {
    enable = true;
    shellAliases = import ./alias.nix;
    initExtra = ''eval $(starship init zsh)'';
  };
  environment.systemPackages = with pkgs; [
    zsh
    zsh-abbr
    zsh-z
    zsh-bd
  ];
}
