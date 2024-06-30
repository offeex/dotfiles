{ lib, pkgs,... }:

with import ../utils.nix;

{
  imports = fnListDirsWithDefault ./.;

  home.username = "offeex";
  home.homeDirectory = "/home/offeex";

  home.stateVersion = "23.11";

  # If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #  /etc/profiles/per-user/rikonardo/etc/profile.d/hm-session-vars.sh
  home.sessionVariables = {
    # EDITOR = "emacs";
    NIX_LD = lib.mkForce "${pkgs.stdenv.cc.libc}/lib/ld-linux-x86-64.so.2"; # зєля молодец!
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
