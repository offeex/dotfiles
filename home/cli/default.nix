{ pkgs, ... }:

with import ../../utils.nix;
{
  imports = fnListDirsWithDefault ./.;

  home.packages = (with pkgs; [
    # TUIs
    bluetuith
    btop
    clipse
    nvtopPackages.full
    pulsemixer

    # CLI
    brightnessctl
    efibootmgr
    hyprpicker
    speedtest-rs
    spicetify-cli
    wl-clipboard
    wlr-randr
    vdpauinfo
    grim
    slurp
    bluetuith
    nmap
    devbox
  ]);
}
