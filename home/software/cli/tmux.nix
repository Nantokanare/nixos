{
  config,
  pkgs,
  home-manager,
  lib,
  ...
}: {
  programs = {
    tmux = {
      baseIndex = 1;
      clock24 = true;
      enable = true;
      escapeTime = 0;
      keyMode = "vi";
      mouse = true;
      resizeAmount = 10;
      sensibleOnTop = true;
      shell = "\${pkgs.fish}/bin/fish";
      shortcut = "t";
      terminal = "kitty";

      plugins = with pkgs.tmuxPlugins; [
        # power-theme
        better-mouse-mode
        sensible
        tilish
        tmux-fzf
        urlview
        vim-tmux-focus-events
        vim-tmux-navigator
        yank
        {
          plugin = continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '30' # minutes
          '';
        }
        #        {
        #          plugin = resurrect;
        #          extraConfig = "
        #  set -g @resurrect-strategy-nvim 'session'
        #";
        #        }
      ];
    };
    fzf.tmux.enableShellIntegration = true;
  };
}
