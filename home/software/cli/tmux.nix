{
  config,
  pkgs,
  home-manager,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;
    escapeTime = 40;
    plugins = with pkgs.tmuxPlugins; [
      # power-theme
      vim-tmux-navigator
      sensible
      yank
      tmux-fzf
      better-mouse-mode
      vim-tmux-focus-events
      urlview
      tilish
      {
        plugin = resurrect;
        extraConfig = "
  set -g @resurrect-strategy-nvim 'session'
";
      }
    ];
  };
}
