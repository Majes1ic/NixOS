{inputs, pkgs, ... }: {
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  programs.hyprland.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # keyboard layout
  services.xserver.xkb.layout = "us";
}