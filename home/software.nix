{term, ...}: {
  imports = [
    ./software/cli.nix
    ./software/browser.nix
    ./software/dev.nix
    ./software/game.nix
    ./software/git.nix
    ./software/shell.nix
    ./software/terminal/${term}.nix
    # ./software/wm.nix
  ];
}
