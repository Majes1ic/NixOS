{ pkgs, ... }:
{
  imports = [ ./core.nix ];

  home.packages = with pkgs; [
    neovim
    micro
    git
  ];

  home.stateVersion = "24.05";
}
