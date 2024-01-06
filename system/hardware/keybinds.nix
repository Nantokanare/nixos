{pkgs, ...}: {
  services.actkbd = {
    enable = true;
    bindings = [
      {
        keys = [113];
        events = ["key"];
        command = "''${pkgs.alsa-utils}/bin/amixer -q set Master toggle";
      }
      #      {
      #        keys = [224];
      #        events = ["key"];
      #        command = "/run/wrappers/bin/light -A 10";
      #      }
      #      {
      #        keys = [225];
      #        events = ["key"];
      #        command = "/run/wrappers/bin/light -U 10";
      #      }
    ];
  };
}
