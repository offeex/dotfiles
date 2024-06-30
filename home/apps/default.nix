{ pkgs, ... }:

with import ../../utils.nix;
{
  imports = fnListDirsWithDefault ./.;

  home.packages = (with pkgs; [
    # Essentials
    gparted
    
    jetbrains.idea-ultimate
    vscodium
    qbittorrent
    obsidian
    vesktop
    vlc
    cloudflare-warp
    dolphin
    brave
    keepassxc
    (exodus.overrideAttrs (oldAttrs: {
      src = requireFile {
        name = "exodus-linux-x64-${oldAttrs.version}.zip";
        url = "https://www.exodus.com/download/";
        hash = "sha256-+g7DdDrSVmBl1wCSCoJcO2gmbWQBnJUYqjT+GuDlCYw=";
        message = ''
          This nix expression requires that exodus-linux-x64-${oldAttrs.version}.zip is already part of the store.
          Please download the file manually from url
          Once downloaded, use the following command to add it to the nix store:
            nix-store --add-fixed sha256 /path/to/downloaded/exodus-linux-x64-${oldAttrs.version}.zip
          Note: You may need to use a web browser with a user agent "Mozilla/5.0" to download the file.
        '';
      };
    }))
  ]);
}
