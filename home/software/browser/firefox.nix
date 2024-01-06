{ config, pkgs, ... }
{

home.file.".mozilla/firefox/your-profile-name/user.js".source = builtins.fetchTarball {
  url = "https://github.com/arkenfox/user.js/archive/refs/tags/stable.tar.gz";
  sha256 = "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";
};

home.file.".mozilla/firefox/your-profile-name/user.js".text = ''
  // Arkenfox user.js preferences
  user_pref("security.fileuri.strict_origin_policy", false);
  // Add more preferences here as needed
'';

home.file.".mozilla/firefox/your-profile-name/policies.json".text = ''
  {
    "policies": {
      // Add more policies here as needed
    }
  }
'';
}
