{...}: {
  # Security
  security = {
    #    pam.services.swaylock = {
    #      text = ''
    #        auth include login
    #      '';
    #    };
    pam.services.gtklock = {};
    pam.services.login.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;
}
