{ lib, username, config, ... }:
let
  cfg = config.modules.virtualisation;
in
{
  options.modules.virtualisation = {
    graphicalVM = lib.mkEnableOption "graphical VM variant";
  };
  config = {
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    users.users.${username}.extraGroups = [ "libvirtd" ];

    virtualisation.vmVariant.virtualisation = {
      cores = 4;
      memorySize = 4096;
      diskSize = 8192;
      graphics = cfg.graphicalVM;

      qemu.options = lib.mkIf cfg.graphicalVM [
        # sdl might be better than gtk on Nvidia
        "-device virtio-vga-gl"
        "-display gtk,gl=on"
        # Non-OpenGL version:
        # "-device virtio-vga"
        # "-display gtk"
      ];
    };
  };
  #users.users.${username}.extraGroups = [ "libvirtd" ];
  #virtualisation.libvirtd.enable = true;
}