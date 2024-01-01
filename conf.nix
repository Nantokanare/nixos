# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  username,
  hostname,
  locale,
  extralocale,
  term,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hwconf.nix
    ./system/security/security.nix
    ./system/hardware/rgb.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = ["amdgpu"];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernelModules = ["i2c-dev" "ic2-piix4"];

  # boot.plymouth.enable = true;

  # Enable SysRQ
  boot.kernel.sysctl."kernel.sysrq" = 1;

  hardware.i2c.enable = true;

  hardware.opengl.enable = true;

  services.picom.vSync = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "${hostname}"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

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

  # Hardware
  hardware.bluetooth.enable = true;
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

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  sound.mediaKeys.enable = true;

  # KDEConnet
  programs.kdeconnect = {
    enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
  };
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
