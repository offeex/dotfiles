{ inputs, config, ... }:

{
  imports = [ inputs.android-nixpkgs.hmModule ];

  android-sdk.enable = true;

  # Optional; default path is "~/.local/share/android".
  android-sdk.path = "${config.home.homeDirectory}/.android/sdk";

  android-sdk.packages = sdk: with sdk; [
    build-tools-34-0-0
    cmdline-tools-latest
    emulator
    platforms-android-34
    sources-android-34
    platform-tools
  ];
}
