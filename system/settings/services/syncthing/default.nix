{ config, ... }:

let
  homeDir = config.users.users.offeex.home;
  docsDir = "/mnt/tiny10/Users/offeex/Documents/Obsidian";
  user = "offeex";
in
{
  services.syncthing = {
    enable = true;
    user = user;
    dataDir = docsDir; # Default folder for new synced folders
    configDir = "${homeDir}/.config/syncthing"; # Folder for Syncthing's settings and keys

    overrideDevices = true;
    overrideFolders = true;

    settings = {
      devices."Poco" = { id = "JSRIIL2-WPX73KO-UREG6VG-IQHOGVN-KL3LFJE-3XWQGHW-MUFLNXO-NKN32AY"; };

      folders."${user}" = {
        devices = [ "Poco" ];
        path = "${docsDir}/${user}";

        versioning = {
          type = "trashcan";
          params.cleanoutDays = "7";
        };
      };

      gui = {
        user = user;
        password = "123";
      };
    };
  };
}
