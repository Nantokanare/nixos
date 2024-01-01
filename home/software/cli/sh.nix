{
  config,
  pkgs,
  ...
}: let
  # My shell aliases
  myAliases = {
    ls = "eza --icons -l -T -L=2";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gfetch = "onefetch";
    nixos-rebuild = "systemd-run --no-ask-password --uid=0 --system --scope -p MemoryLimit=16000M -p CPUQuota=60% nixos-rebuild";
    home-manager = "systemd-run --no-ask-password --uid=1000 --user --scope -p MemoryLimit=16000M -p CPUQuota=60% home-manager";
  };
in {
  programs.fish = {
    enable = true;
    shellAliases = myAliases;
    interactiveShellInit = ''
           if status is-interactive
                       and not set -q TMUX
                       exec tmux
      starship init fish | source

      end

    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  #  home.packages = with pkgs; [
  #    disfetch
  #    lolcat
  #    cowsay
  #    onefetch
  #    gnugrep
  #    gnused
  #    bat
  #    eza
  #    bottom
  #    fd
  #    direnv
  #    nix-direnv
  #  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
