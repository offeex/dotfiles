{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      twemoji-color-font

      inter
      raleway

      (nerdfonts.override { fonts = [ "CascadiaCode" "RobotoMono" "FiraCode" ]; })
    ];
  };
}
