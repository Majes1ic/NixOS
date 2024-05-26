# first module!!
{ inputs, hostname, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/audio.nix
    ../../modules/hardware/networking.nix
    ../../modules/system/gnome.nix
    # ../../modules/system/greetd.nix
    ../../modules/programs/steam.nix
    ../../modules/programs/wireguard.nix
  ];

  # add screenshot config
  
  networking.hostId = "150ce5b1";
  system.stateVersion = "23.05";
}