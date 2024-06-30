{ pkgs, stdenv, ... }:

with import ../../utils.nix;
{
  imports = fnListDirsWithDefault ./.;

  # user-specific programs with no configuration are listed here


  programs = {
    java = {
      enable = true;
      package = pkgs.temurin-bin-17;
    };
  };

  home.packages = (with pkgs; [

    # Other
    modrinth-app
    docker
    bun
    libsForQt5.kdegraphics-thumbnailers
    nodejs
    nodePackages.pnpm
    # zoom-us
    inetutils
    aichat
  ]);
}
