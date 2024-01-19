{pkgs, ...}: {
  programs = {
    git = {
      enable = true;
      delta.enable = true;
      package = pkgs.gitAndTools.gitFull;
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
