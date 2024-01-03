{
  config,
  pkgs,
  editor,
  username,
  term,
  ...
}: {
  imports = [
    ./software.nix
  ];
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    file = {
    };

    sessionVariables = {
      EDITOR = editor;
    };
    packages = with pkgs; [
      bat
      bottom
      cava
      cowsay
      disfetch
      eza
      lazygit
      fd
      fzf
      git
      gnugrep
      gnused
      htop
      hwinfo
      killall
      libnotify
      lolcat
      neofetch
      octave
      onefetch
      pandoc
      pciutils
      ranger
      ripgrep
      rsync
      unzip
      w3m

      (pkgs.nerdfonts.override {fonts = ["Monofur"];})
    ];
  };

  programs.home-manager.enable = true;
}
