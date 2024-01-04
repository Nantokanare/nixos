{
  term,
  wm,
  wmtype,
  ...
}: {
  imports = [
    ./software/cli.nix
    ./software/browser.nix
    ./software/dev.nix
    ./software/game.nix
    ./software/git.nix
    ./software/terminal/${term}.nix
    ./software/${wmtype}/${wm}.nix
  ];
}
