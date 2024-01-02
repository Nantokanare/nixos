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
        "audio"
      ]
      ++ ifTheyExist [
        "minecraft"
        "network"
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
  };
}
