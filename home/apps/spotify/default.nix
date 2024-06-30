{ pkgs, inputs, ... }:
let
  spicetify = inputs.spicetify-nix;
in
{
  imports = [ spicetify.homeManagerModule ];

  #  services.spotifyd = {
  #    enable = true;
  #    settings.global = {
  #      username = "rockezprod@gmail.com";
  #      password = "7Uex7f8Nw5L%";
  #      device_name = "nixos";
  #    };
  #  };

  programs.spicetify = {
    enable = true;
    #    theme = spicePkgs.themes.catppuccin;
    #    colorScheme = "mocha";

    enabledExtensions = with spicetify.packages.${pkgs.system}.default.extensions; [
      adblock
    ];
  };
}
