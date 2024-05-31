{
  imports = [
    ./nix.nix
    ./user.nix
    ./home-manager.nix
    ./filesystem.nix
  ];

  programs.zsh.enable = true;

  time.timeZone = "Europe/London";
}
