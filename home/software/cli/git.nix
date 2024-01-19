{...}: {
  programs = {
    git = {
      enable = true;
      delta.enable = true;
      ignores = [
        "*~"
        "*.swp"
      ];
    };
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
