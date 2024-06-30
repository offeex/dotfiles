{ pkgs, ... }:

with import ../../utils.nix;
{
  imports = fnListDirsWithDefault ./.;

  services = {
    flameshot.enable = true;
  };

  home.packages = (with pkgs; [
    
    # opinionated ricing shit
    greetd.tuigreet
    hyprlock
    hyprcursor
    hyprshot
    libnotify
    libsForQt5.qtstyleplugin-kvantum
    swww

    # Daemons
    hypridle
    xdg-desktop-portal-wlr
  ]);
}
