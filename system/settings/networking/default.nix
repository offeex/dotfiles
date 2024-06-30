{
  networking = {
    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    #    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };
}
