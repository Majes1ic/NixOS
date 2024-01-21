{ pkgs, ... }: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "max";
      extraFiles = {
        #"efi/memtest86+/memtest86+.efi" = "${pkgs.memtest86plus}/memtest.efi";
        "efi/edk2-shell/shellx64.efi" = pkgs.edk2-uefi-shell.efi;
      };
      extraEntries = {
        #uncomment to add windows boot entry
        #"edk2-shell.conf" = ''
        #  title edk2-shell
        #  efi /efi/edk2-shell/shellx64.efi
        #'';
          "windows.conf" = ''
          title windows
          efi /efi/windows/windows.nsh
        '';
      };
    };
    efi = {
      canTouchEfiVariables = true;
    };
  };
}