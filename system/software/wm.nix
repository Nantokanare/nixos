{
  wm,
  wmtype,
  ...
}: {
  imports = [
    ./wm/${wmtype}/${wm}.nix
  ];
}
