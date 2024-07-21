{ pkgs, ... }:
{
  imports = [
    ./core.nix
    ./programs/kitty.nix
  ];

  home.packages = with pkgs; [ neovim ];

  home.stateVersion = "24.05";
}
