{
  config,
  pkgs,
  ...
}: let
  # My shell aliases
  myAliases = {
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

    #    nixos-rebuild = "systemd-run --no-ask-password --uid=0 --system --scope -p MemoryLimit=16000M -p CPUQuota=60% nixos-rebuild";
    #    home-manager = "systemd-run --no-ask-password --uid=1000 --user --scope -p MemoryLimit=16000M -p CPUQuota=60% home-manager";
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
