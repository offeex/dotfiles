{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  xdg.configFile."hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink /home/offeex/dotfiles/home/display/hyprland/hyprland.conf;
}
