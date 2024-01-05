{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zsh
    zsh-abbr
    zsh-z
    zsh-bd
  ];
}
