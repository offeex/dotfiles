builtins.trace "${./.}"
({ pkgs, ... }:

with import ../utils.nix;
{
  imports = (fnListDirsWithDefault ./settings) ++ [ ./hardware-configuration.nix ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      efi = {
        canTouchEfiVariables = true;
      };

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
    };
  };

  networking.hostName = "offeex-pc";

  time.timeZone = "Europe/Kyiv";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.offeex = {
    isNormalUser = true;
    description = "offeex";
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    sessionVariables = {
      FLAKE = "/home/offeex/dotfiles";
      NIXOS_OZONE_WL = "0";

      VSCODE_GALLERY_SERVICE_URL = "https://marketplace.visualstudio.com/_apis/public/gallery";
      VSCODE_GALLERY_CACHE_URL = "https://vscode.blob.core.windows.net/gallery/index";
      VSCODE_GALLERY_ITEM_URL = "https://marketplace.visualstudio.com/items";
      VSCODE_GALLERY_CONTROL_URL = "";
      VSCODE_GALLERY_RECOMMENDATIONS_URL = "";
    };
  };

  system.stateVersion = "23.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
})
