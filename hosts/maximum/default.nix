# first module!!
{ inputs, hostname, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/audio.nix
    ../../modules/hardware/networking.nix
    ../../modules/system/desktop.nix
  ];

  # home config
  # home hyprland config
  # go to arch and upload windows boot files for systemd-boot
  # creating boot partition, mount to /boot
  # generate and update hostID below using: 'head -c 8 /etc/machine-id'
  # add screenshot config
  
  networking.hostId = "625ec505";
  system.stateVersion = "23.05";
}