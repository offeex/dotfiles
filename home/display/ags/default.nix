{ pkgs, config, inputs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {

    enable = true;
    # configDir = ./configs;
  };
  xdg.configFile."ags".source = config.lib.file.mkOutOfStoreSymlink /home/offeex/dotfiles/home/programs/ags/configs;
}
