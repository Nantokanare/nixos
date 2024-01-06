{
  pkgs,
  lib,
  config,
  shell,
  ...
}: {
  imports = [
  ];
  #  if (shell == "bash" || "zsh" || "fish")
  #	  then [
  programs.${shell} = {
    enable = true;
    shellAliases = {
      cdd = "cd ..";
      ls = "eza --icons -l -T -L=2";
      cat = "bat";
      htop = "btm";
      fd = "fd -Lu";
      gt = "git add * && git commit -m \"fast commit\"";
      w3m = "w3m -no-cookie -v";
      neofetch = "disfetch";
      fetch = "disfetch";
      gfetch = "onefetch";
      n = "nix";
      nd = "nix develop -c $SHELL";
      ns = "nix shell -p";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nf = "nix flake";

      nrs = "sudo nixos-rebuild --flake . switch";
      hms = "home-manager --flake . switch";
    };
  };
  #  ];
  #  else [
  #  environment.systemPackages = with pkgs; [
  #    nushellFull
  #    nushellPlugins.gstat
  #    nushellPlugins.formats
  #    nushellPlugins.regex
  #    nushellPlugins.net
  #  ];];
  programs = {
    neovim.defaultEditor = true;
    thefuck.enable = true;
    nano.enable = false;
  };
  users.defaultUserShell = pkgs.${shell};
}
