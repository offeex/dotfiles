{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number relativenumber
    '';
  };
}
