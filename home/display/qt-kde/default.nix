{ config, environment, nixpkgs, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    tela-icon-theme
    graphite-kde-theme
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "qt5ct/qt5ct.conf".text = (builtins.readFile ./qt5ct.conf);

    "Kvantum/kvantum.kvconfig".text = (builtins.readFile ./kvantum.kvconfig);

    "kdeglobals".text = (builtins.readFile ./kdeglobals);

    "Kvantum/GraphiteNord".source = "${pkgs.graphite-kde-theme}/share/Kvantum/GraphiteNord";
  };

  home.file.".profile".text = ''
    export QT_QPA_PLATFORMTHEME=qt5ct
    export QT_STYLE_OVERRIDE=kvantum
  '';
}
