{
  config,
  pkgs,
  lib,
  shell,
  ...
}: {
  options = {
  };

  config = {
    home.packages = with pkgs; [
      kitty
    ];
    programs = {
      kitty = {
        #    (if (shell == "fish") then shellIntegration.enableFishIntegration = true;
        #     else (if (shell == "zsh") then shellIntegration.enableZshIntegration = true;
        #             else (if (shell == "bash") then shellIntegration.enableBashIntegration = true;
        #      	       else []))
        #    );
        enable = true;
        shellIntegration.enableZshIntegration = true;
        settings = {
          background_opacity = lib.mkForce "0.65";
          scrollback_lines = 10000;
          enable_audio_bell = true;
          update_check_interval = 0;
        };
      };
    };
  };
}
