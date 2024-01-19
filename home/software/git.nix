{
  pkgs,
  name,
  email,
  ...
}: {
  programs = {
    git = {
      enable = true;
      delta.enable = true;
      package = pkgs.gitAndTools.gitFull;
      userName = name;
      ignores = [
        "*~"
        "*.swp"
      ];
      userEmail = email;
      extraConfig = {
        init.defaultBranch = "Master";
      };
    };
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
