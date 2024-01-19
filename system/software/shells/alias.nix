{...}: {
  cdd = "cd ..";
  ls = "eza --icons";
  ll = "eza --icons -l -T -L=1";
  lll = "eza --icons -l -T -L=2";
  cat = "bat";
  fd = "fd -Lu";
  gt = "git add * && git commit -m \"fast commit\"";
  w3m = "w3m -no-cookie -v";
  fetch = "disfetch";
  gfetch = "onefetch";
  ns = "nix-shell -p";
  nrs = "sudo nixos-rebuild --flake . switch";
  hms = "home-manager --flake . switch";
  mpc = "mpc --host=''/run/user/1000/mpd/socket''";
}
