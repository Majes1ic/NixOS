{ pkgs, ... }: {
  boot.loader.systemd-boot = {
    extraFiles = {
      "EFI/edk2-shell/shellx64.efi" = pkgs.edk2-uefi-shell.efi;
    };

    # This requires manually setting up /windows.nsh in the ESP partition
    # https://forum.endeavouros.com/t/tutorial-add-a-systemd-boot-loader-menu-entry-for-a-windows-installation-using-a-separate-esp-partition/37431

    extraEntries = {
      # Uncomment to enable edk2-shell for setting up windows boot entry
      # "edk2-shell.conf" = ''
      #   title edk2-shell
      #   efi /EFI/edk2-shell/shellx64.efi
      # '';
      "windows.conf" = ''
        title Windows
        efi /EFI/edk2-shell/shellx64.efi
        options -nointerrupt -noconsolein -noconsoleout windows.nsh
      '';
    };
  };

  programs.zsh.shellAliases = {
    boot-windows = "systemctl reboot --boot-loader-entry=windows.conf";
  };
  environment.systemPackages = [ pkgs.ntfs3g ];
}
