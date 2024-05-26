{ pkgs, ... }:
{
  imports = [
    # TODO: Core should be imported but it contains gtk and dconf config that
    # shouldn't be there
    # ./core.nix
  ];

  home.packages = with pkgs; [
    neovim
    micro
    git
  ];
}
