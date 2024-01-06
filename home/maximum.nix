{
  imports = [
    ./core.nix
    ./desktop/hyprland.nix
  ];

  packages = with pkgs; [
    kitty
    webcord
    firefox
  ];
}