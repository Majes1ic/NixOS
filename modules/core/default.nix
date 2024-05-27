{ username, hostname, ... }: {
  imports = [
    ./nix.nix
    ./user.nix
    ./home-manager.nix
    ./filesystem.nix
  ];

  time.timeZone = "Europe/London";
}
