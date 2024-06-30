with import ../../../utils.nix;
{
  imports = fnListDirsWithDefault ./.;

  hardware.enableAllFirmware = true; # bluetooth + wifi 2.4Ghz troll
}
