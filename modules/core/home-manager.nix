{ inputs, username, hostname, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs username hostname; };
    # home manager uses same nix package as OS
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      ${username} = import ../../home/${hostname}.nix;
    };
  };
  programs.vscode = {
    enable = true;
  }
  programs.rofi = {
    enable = true;
  }
}