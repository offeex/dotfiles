# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" ];
    initrd.kernelModules = [ ];

    kernelModules = [ "kvm-amd" "lenovo-legion-module" ];
    extraModulePackages = with pkgs.linuxPackages_zen; [ lenovo-legion-module ];

    kernelParams = [ "amd_pstate=guided" ];
    supportedFilesystems = [ "ntfs" ];
  };

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/b9705615-3987-4462-90c5-c3ecf5d15442";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/45B9-5E83";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/mnt/tiny10" =
    {
      device = "/dev/disk/by-uuid/34182AF6685E47AD";
      fsType = "ntfs-3g";
      options = [ "rw" ];
    };

    # fileSystems."/mnt/sda1" =
    # {
    #   device = "/dev/sda1"
    #   fsType = 
    # };

  swapDevices = [
    { device = "/dev/disk/by-uuid/5f785c34-9bbd-449f-84e3-6819ae40bb5d"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0f3u2u2.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
