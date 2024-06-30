with import ../../../utils.nix;
{
  imports = fnListDirsWithDefault ./.;

  # simple services with no configuration are listed here
  services = {
    tumbler.enable = true;
    logrotate.checkConfig = false; # nixos bug
  };
}
