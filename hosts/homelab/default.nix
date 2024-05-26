{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/hardware/networking.nix
    # Wireguards needs options for customising
    # ../../modules/programs/wireguard.nix
  ];

  # TODO: Generate a random hostID
  networking.hostID = "d48f462c";
  system.stateVersion = "23.05";
}
