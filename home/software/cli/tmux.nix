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
      terminal = "tmux-256color";
      newSession = true;
      extraConfig = ''
        resurrect_dir="$HOME/.tmux/resurrect"
        set -g @resurrect-dir $resurrect_dir
        set -g @resurrect-hook-post-save-all 'target=$(readlink -f $resurrect_dir/last); sed "s| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g; s|/home/$USER/.nix-profile/bin/||g" $target | sponge $target'
      '';

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
            set -g @continuum-save-interval '5' # minutes
          '';
        }
        {
          plugin = resurrect;
        }
      ];
    };
    fzf.tmux.enableShellIntegration = true;
  };
}
