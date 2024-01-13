{
  config,
  pkgs,
  username,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups =
      [
        "networkmanager"
        "wheel"
        "corectrl"
        "video"
        "mpd"
        "audio"
        "dialout"
      ]
      ++ ifTheyExist [
        "minecraft"
        "network"
        "adbusers"
        "wireshark"
        "i2c"
        "mysql"
        "docker"
        "podman"
        "git"
        "libvirtd"
        "deluge"
      ];
    packages = with pkgs; [
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMNwcZsUPxhis9c3bIlbfi10PUxU/iLWUoHIk29F8dn nantokanare@R9"
    ];
  };
}
