{
  pkgs,
  shell,
  ...
}: {
  programs.${shell} = {
    enable = true;
    shellAliases = import ./alias.nix {inherit pkgs;};
    enableCompletion = true;
    autosuggestions.enable = true;
    enableBashCompletion = true;
    autosuggestions.strategy = [
      "completion"
    ];
  };
  environment.systemPackages = with pkgs; [
    zsh
    zsh-abbr
    zsh-forgit
    zsh-history
    zsh-fzf-tab
    zsh-nix-shell
    zsh-git-prompt
    zsh-completions
    zsh-autocomplete
    zsh-you-should-use
    zsh-autosuggestions
    zsh-system-clipboard
    zsh-z
    zsh-navigation-tools
    zsh-syntax-highlighting
    zsh-vi-mode
    zsh-command-time
    zsh-bd
  ];
}
