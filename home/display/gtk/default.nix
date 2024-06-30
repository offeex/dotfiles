{ config, environment, nixpkgs, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    tela-icon-theme
    tokyo-night-gtk
    bibata-cursors
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Tela-nord-dark";
      package = pkgs.tela-icon-theme;
    };

    theme = {
      name = "Tokyonight-Dark-B-LB";
      package = pkgs.tokyo-night-gtk;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };
}
