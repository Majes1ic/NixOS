{ pkgs, ... }:
{
  imports = [
    ./core.nix
  ];

  home.packages = with pkgs; [
    neovim
    micro
    git
  ];
}
