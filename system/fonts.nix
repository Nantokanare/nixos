{
  config,
  pkgs,
  ...
}: {
  # Fonts are nice to have
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      # Fonts
      (nerdfonts.override {fonts = ["Inconsolata"];})
      powerline
      inconsolata
      inconsolata-nerdfont
      mononoki
      iosevka
      font-awesome
      ubuntu_font_family
      terminus_font
    ];
  };
}
