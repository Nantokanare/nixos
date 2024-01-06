{
  config,
  pkgs,
  ...
}: {
  home.file.".mozilla/firefox/default/user.js".source = builtins.fetchTarball {
    url = github:arkenfox/user.js;
  };

  home.file.".mozilla/firefox/default/user.js".text = ''
    // Arkenfox user.js preferences
    user_pref("security.fileuri.strict_origin_policy", false);
    // Add more preferences here as needed
  '';

  home.file.".mozilla/firefox/default/policies.json".text = ''
    {
      "policies": {
        // Add more policies here as needed
      }
    }
  '';
}
