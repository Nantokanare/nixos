# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  username,
  hostname,
  timezone,
  locale,
  extralocale,
  term,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hwconf.nix
    ./system/hw.nix
    ./system/net.nix
    ./system/security.nix
    ./system/software.nix
    ./system/user.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.kernelPackages = pkgs.linuxPackages_zen;

  # boot.plymouth.enable = true;

  # Enable SysRQ
  boot.kernel.sysctl."kernel.sysrq" = 1;

  hardware.opengl.enable = true;

  services.picom = {
    enable = true;
    vSync = true;
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Set your time zone.
  time.timeZone = timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = extralocale;
    LC_IDENTIFICATION = extralocale;
    LC_MEASUREMENT = extralocale;
    LC_MONETARY = extralocale;
    LC_NAME = extralocale;
    LC_NUMERIC = extralocale;
    LC_PAPER = extralocale;
    LC_TELEPHONE = extralocale;
    LC_TIME = extralocale;
  };
  # Enable EnvFS
  services.envfs.enable = true;

  # Fix USB sticks not mounting or being listed:
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Enable acpid
  services.acpid.enable = true;
  # Enable networking

  # XDG Desktop Portal stuff
  #  xdg.portal = {
  #    enable = true;
  #    extraPortals = with pkgs; [
  #      xdg-desktop-portal
  #      xdg-desktop-portal-gtk
  #    ];
  #  };

  # Printing support
  services.printing = {
    enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Cinnamon Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status-rust
      i3lock
      i3-resurrect
      i3nator
      i3-ratiosplit
      pulseaudioFull
      nitrogen
      picom
    ];
  };
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # KDEConnet
  programs.kdeconnect = {
    enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  #  home-manager.users.${username} = { pkgs, ... }: {
  #		  home.packages = with pkgs; [
  #
  #              alacritty
  #              fish
  #              firefox
  #              git
  #              ranger
  #
  #		  ];
  #  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "${username}";
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    alsa-utils
    blueman
    brave
    btop
    firefox
    fish
    fzf
    git
    home-manager
    htop
    keepassxc
    libyubikey
    mpv
    neofetch
    neovim
    nerdfonts
    pamixer
    pavucontrol
    pfetch
    qbittorrent
    ranger
    starship
    syncthing
    tldr
    tmux
    vifm
    vlc
    wget
    wshowkeys
    yubico-pam
    yubico-piv-tool
    yubioath-flutter
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
