{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/hardware/networking.nix
    ../../modules/system/virtualisation.nix
    # Wireguards needs options for customising
    # ../../modules/programs/wireguard.nix
  ];

  networking.hostId = "d48f462c";
  system.stateVersion = "23.05";
}
