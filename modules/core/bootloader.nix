{
  boot = {
    loader.systemd-boot = {
      enable = true;
      consoleMode = "keep";
    };
    loader.efi.canTouchEfiVariables = true;
  };
}