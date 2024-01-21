{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
     # nvidia hardware acceleration
    extraPackages = [ pkgs.vaapiVdpau pkgs.nvidia-vaapi-driver ];
  };

  hardware.nvidia = {
    # Major issues if this is disabled
    modesetting.enable = true;
    open = true;
    nvidiaSettings = false;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
