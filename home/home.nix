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
      sonic-pi
      ranger
      ripgrep
      rsync
      unzip
      w3m

      (pkgs.nerdfonts.override {fonts = ["Monofur"];})
    ];
  };
  services.syncthing.enable = true;

  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      associations.added = {
        # "application/octet-stream" = "flstudio.desktop;";
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/media/music";
      videos = "${config.home.homeDirectory}/media/videos";
      pictures = "${config.home.homeDirectory}/media/pictures";
      templates = "${config.home.homeDirectory}/templates";
      download = "${config.home.homeDirectory}/downloads";
      documents = "${config.home.homeDirectory}/documents";
      desktop = null;
      publicShare = null;
      extraConfig = {
        XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
        XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/archive";
        XDG_VM_DIR = "${config.home.homeDirectory}/machines";
        XDG_ORG_DIR = "${config.home.homeDirectory}/org";
        XDG_BOOK_DIR = "${config.home.homeDirectory}/media/books";
      };
    };
  };

  home.sessionVariables = {
    EDITOR = editor;
    TERM = term;
    BROWSER = browser;
  };

  programs.home-manager.enable = true;
}
