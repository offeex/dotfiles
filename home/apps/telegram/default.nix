{ pkgs, ... }:

{
  home.packages = [ pkgs.telegram-desktop ];

  # :clown:
  xdg.desktopEntries.telegram = {
    name = "telegram";
    genericName = "Internet Messenger";
    exec = "telegram-desktop %u";
    type = "Application";
    comment = "Cross-platform instant messaging service with optional end-to-end encryption";
    categories = [ "Network" "InstantMessaging" "Qt" "Chat" ];
  };
}
