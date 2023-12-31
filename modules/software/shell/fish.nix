{
  pkgs,
  home-manager,
  ...
}: {
  programs.fish = {
    enable = true;
        shellInit = 
''	
           if status is-interactive
                     # and not set -q TMUX
                     #    exec tmux    # Commands to run in interactive sessions can go here
     starship init fish | source
    
     end

		'';
        };
    #    # fishPlugins.plugin-git
}
