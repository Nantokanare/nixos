{pkgs, ...}: {
  services.actkbd = {
    enable = true;
    bindings = [
      {
        keys = [115];
        events = ["key"];
        command = "''${pkgs.alsa-utils}/bin/pactl set-sink-volume @DEFAULT_SINK@ +10%";
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
