{ pkgs, config, ... }: {
  hardware.graphics = {
    enable = true;
    #driSupport = true;
    #driSupport32Bit = true;
    # nvidia hardware acceleration
    extraPackages = [ pkgs.vaapiVdpau pkgs.nvidia-vaapi-driver ];
  };

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    # Major issues if this is disabled
    modesetting.enable = true;
    open = true;
    nvidiaSettings = false;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # Fixes extra ghost display
  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];

}
