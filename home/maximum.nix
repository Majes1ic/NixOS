{ pkgs, ... }: {
  imports = [
    ./core.nix
    ./desktop/hyprland.nix
  ];

  home.packages = with pkgs; [
    kitty
    webcord
    firefox
  ];
}