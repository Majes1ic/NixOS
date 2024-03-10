{ pkgs, ... }: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "max";
      extraFiles = {
        #"efi/memtest86+/memtest86+.efi" = "${pkgs.memtest86plus}/memtest.efi";
        "EFI/edk2-shell/shellx64.efi" = pkgs.edk2-uefi-shell.efi;
      };
      extraEntries = {
        #uncomment to add windows boot entry
        #"edk2-shell.conf" = ''
        #  title edk2-shell
        #  efi /EFI/edk2-shell/shellx64.efi
        #'';
        "windows.conf" = ''
          title Windows
          efi /EFI/edk2-shell/shellx64.efi
          options -nointerrupt -noconsolein -noconsoleout windows.nsh
        '';
      };
    };
    efi = {
      canTouchEfiVariables = true;
    };
  };
  programs.zsh.shellAliases = {
    boot-windows = "systemctl reboot --boot-loader-entry=windows.conf";
  };
}