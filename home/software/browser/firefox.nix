{
  config,
  pkgs,
  ...
}: {
  home.file.".mozilla/firefox/default/user.js".source = builtins.fetchTarball {
    url = github:arkenfox/user.js;
    sha256 = "4a510a4b4ceda8a177831a77309f2faccf7e18d5";
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
