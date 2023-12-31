{ ... }: {
  # Import all your configuration modules here
  imports = [
    ./core.nix
    ./plugins.nix
    ./keymaps.nix
  ];
}
