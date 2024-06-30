{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
    wlr = {
      enable = true;
      #      settings = {
      #        screencast = {
      #          chooser_type = "simple";
      #          chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -ro";
      #        };
      #      };
    };
  };
}
