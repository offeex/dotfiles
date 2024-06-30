{ pkgs, ... }:

{
  security.polkit.enable = true;
  environment.systemPackages = [ pkgs.polkit_gnome ];
}
