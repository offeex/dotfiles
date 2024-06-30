{...}:

with import ../../utils.nix;
{
  imports = fnListDirsWithDefault ./.;
}