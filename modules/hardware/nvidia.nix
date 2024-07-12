{ pkgs, config, ... }: {
  hardware.graphics = {
    enable = true;
    # nvidia hardware acceleration
    extraPackages = with pkgs; [
      vaapiVdpau
      nvidia-vaapi-driver
    ];
  };

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    # Major issues if this is disabled
    modesetting.enable = true;
    # Eventually enable this
    open = false;
    nvidiaSettings = false;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # Fixes extra ghost display
  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];

  # Completely disable suspend and hibernate as it seems broken on nvidia and
  # accidentally pressing the button in gnome can put the system in a broken
  # state
  systemd = {
    targets = {
      sleep = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
      suspend = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
      hibernate = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
      hybrid-sleep = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
    };
  };
}
