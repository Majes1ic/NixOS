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
    ../../modules/system/virtualisation.nix
    ../../modules/programs/steam.nix
    ../../modules/programs/wireguard.nix
  ];

  modules.virtualisation.graphicalVM = true;

  environment.systemPackages = with pkgs; [
    lm_sensors
  ];

  networking.hostId = "150ce5b1";
  system.stateVersion = "23.05";
}
