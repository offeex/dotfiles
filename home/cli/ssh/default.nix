{ ... }:

{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "gosgarant" = {
        hostname = "95.164.6.162";
        port = 22;
        user = "root";
      };
      "gosgarant-2" = {
        hostname = "135.125.51.5";
        port = 22;
        user = "smsuser";
      };
    };
  };
}
