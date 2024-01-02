{...}: {
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
    ns = "nix shell";
    nsn = "nix shell nixpkgs#";
    nb = "nix build";
    nbn = "nix build nixpkgs#";
    nf = "nix flake";

    nr = "nixos-rebuild --flake .";
    nrs = "nixos-rebuild --flake . switch";
    snr = "sudo nixos-rebuild --flake .";
    snrs = "sudo nixos-rebuild --flake . switch";
    hm = "home-manager --flake .";
    hms = "home-manager --flake . switch";
  };
}
