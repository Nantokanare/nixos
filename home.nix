{
  config,
  pkgs,
  username,
  term,
  ...
}: {
  home.username = "nantokanare";
  home.homeDirectory = "/home/nantokanare";

  imports = [
    ./modules/software/cli/cli.nix
    ./modules/software/terminal/${term}.nix
  ];

  home.packages = with pkgs; [
    ranger
    git
    disfetch
    neofetch
    lolcat
    cowsay
    onefetch
    cava
    gnugrep
    gnused
    killall
    libnotify
    bat
    eza
    fd
    bottom
    ripgrep
    rsync
    htop
    hwinfo
    unzip
    octave
    w3m
    fzf
    pandoc
    pciutils
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
