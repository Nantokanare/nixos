{
  pkgs,
  myAliases,
  home-manager,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = myAliases;
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
