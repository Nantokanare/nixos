{
  wm,
  wmtype,
  ...
}: {
  imports = [
    ./${wmtype}/${wm}/${wm}.nix
  ];
}
