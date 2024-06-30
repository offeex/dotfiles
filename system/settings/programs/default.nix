{ inputs, pkgs, ... }:

with import ../../../utils.nix;
{
  imports = fnListDirsWithDefault ./.;

  # system-wide programs with no configuration are listed here

  programs = {
    dconf.enable = true;
    git.enable = true;
    nix-ld.enable = true; # піздєєєєєєццц
    adb.enable = true;
    zsh.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # core
    lenovo-legion
    xorg.xhost

    # nix-specific
    nixpkgs-fmt
    nil
    nh
    cachix

    powertop
    p7zip
    unzip
  ] ++ (with inputs; [
    nix-inspect.packages.${system}.default
  ]);
}
