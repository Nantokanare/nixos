{
  pkgs,
  shell,
  ...
}: {
  programs.${shell} = {
    enable = true;
    shellAliases = import ./alias.nix {inherit pkgs;};
    interactiveShellInit = ''eval $(starship init zsh)'';
  };
  environment.systemPackages = with pkgs; [
    zsh
    zsh-abbr
    zsh-z
    zsh-bd
  ];
}
