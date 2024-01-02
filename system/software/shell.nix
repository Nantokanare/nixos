{
  pkgs,
  shell,
  ...
}: {
  programs.${shell} = {
    enable = true;
    shellAliases = {
      cdd = "cd ..";
      ls = "eza --icons -l -T -L=2";
      cat = "bat";
      htop = "btm";
      fd = "fd -Lu";
      gt = "git add * && git commit -m \"fast commit\"";
      w3m = "w3m -no-cookie -v";
      neofetch = "disfetch";
      fetch = "disfetch";
      gfetch = "onefetch";
      n = "nix";
      nd = "nix develop -c $SHELL";
      ns = "nix shell";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nf = "nix flake";

      nr = "nixos-rebuild --flake .";
      nrs = "nixos-rebuild --flake . switch";
      snr = "sudo nixos-rebuild --flake .";
      snrs = "sudo nixos-rebuild --flake . switch";
      hm = "home-manager --flake .";
      hms = "home-manager --flake . switch";
    };
    shellInit = ''
            if status is-interactive
                       and not set -q TMUX
                       exec tmux
      starship init fish | source

      end

    '';
  };
  users.defaultUserShell = pkgs.${shell};
  #  enableCompletion = true;
  #    promptInit = ''
  #      # Provide a nice prompt if the terminal supports it.
  #      if [ "$TERM" != "dumb" ] || [ -n "$INSIDE_EMACS" ]; then
  #        PROMPT_COLOR="1;31m"
  #        ((UID)) && PROMPT_COLOR="1;32m"
  #        if [ -n "$INSIDE_EMACS" ]; then
  #          # Emacs term mode doesn't support xterm title escape sequence (\e]0;)
  #          PS1="\n\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
  #        else
  #          PS1="\n\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
  #        fi
  #        if test "$TERM" = "xterm"; then
  #          PS1="\[\033]2;\h:\u:\w\007\]$PS1"
  #        fi
  #      fi
  #    '';
  #    #shellInit =
  #  };
  # environment.pathsToLink = ["/share/bash-completion"];
}
