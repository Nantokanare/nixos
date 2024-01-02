{
  pkgs,
  home-manager,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = ./sh.nix;
    shellInit = ''
            if status is-interactive
                       and not set -q TMUX
                       exec tmux
      starship init fish | source

      end

    '';
  };
  #    # fishPlugins.plugin-git
}
