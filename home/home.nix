{
  config,
  browser,
  pkgs,
  editor,
  username,
  term,
  ...
}: {
  imports = [
    ./software.nix
    ./stylix.nix
  ];
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    file = {
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
  services.syncthing.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;
  xdg.mimeApps.associations.added = {
    "application/octet-stream" = "flstudio.desktop;";
  };

  home.sessionVariables = {
    EDITOR = editor;
    TERM = term;
    BROWSER = browser;
  };

  programs.home-manager.enable = true;
}
