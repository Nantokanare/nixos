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
      userEmail = email;
      extraConfig = {
        init.defaultBranch = "Master";
        ignores = [
          "*~"
          "*.swp"
        ];
      };
    };
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
