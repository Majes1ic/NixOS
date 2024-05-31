{
  boot = {
    initrd.systemd.enable = true;
    loader.efi.canTouchEfiVariables = true;

    loader.systemd-boot = {
      enable = true;
      consoleMode = "max";
      configurationLimit = 20;
    };
  };

  # Use compressed RAM for swap
  swapDevices = [ ];
  zramSwap.enable = true;

  # Weekly SSD triming
  services.fstrim.enable = true;
}
