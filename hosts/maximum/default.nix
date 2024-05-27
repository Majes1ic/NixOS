{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/hardware/windows.nix
    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/audio.nix
    ../../modules/hardware/networking.nix
    ../../modules/system/gnome.nix
    ../../modules/programs/steam.nix
    ../../modules/programs/wireguard.nix
  ];

  networking.hostId = "150ce5b1";
  system.stateVersion = "23.05";
}
