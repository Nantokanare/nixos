{
  pkgs,
  shell,
  ...
}: {
  imports = [
    ./shells/${shell}.nix
  ];

  users.defaultUserShell = pkgs.${shell};
  #  if (shell == "bash" || "zsh" || "fish")
  #	  then [
  #  ];
  #  else [
  #  environment.systemPackages = with pkgs; [
  #    nushellFull
  #    nushellPlugins.gstat
  #    nushellPlugins.formats
  #    nushellPlugins.regex
  #    nushellPlugins.net
  #  ];];
}
