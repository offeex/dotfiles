{ config, lib, ... }:

{
  # Still needs to load at some point if we want X11 to work
  boot.kernelModules = [ "amdgpu" ];

  # modesetting just doesn't work (on X11?), so get rid of it by only explicitly declaring nvidia
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    nvidia = {
      powerManagement = {
        enable = true;
        finegrained = true;
      };

      prime = {
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  #  environment.sessionVariables = {
  #    # vdpau
  #    VDPAU_DRIVER = nvidia;
  #
  #    # vaapi
  #    LIBVA_DRIVER_NAME = nvidia;
  #    NVD_GPU = 0;
  #    NVD_BACKEND = direct;
  #
  #    GBM_BACKEND = nvidia-drm; # for some fucking reason, brave wayland can't work without it
  #  };
}
