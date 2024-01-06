{
  config,
  pkgs,
  shell,
  term,
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
      sensibleOnTop = false;
      shell = "${pkgs.${shell}}/bin/${shell}";
      shortcut = "t";
      terminal = term;

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
        {
          plugin = resurrect;
          extraConfig = "
          set -g @resurrect-strategy-nvim 'session'
        ";
        }
      ];
    };
    fzf.tmux.enableShellIntegration = true;
  };
}
