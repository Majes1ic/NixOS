{inputs, pkgs, ... }: {
  # imports = [
  #   inputs.hyprland.nixosModules.default
  # ];

  # programs.hyprland.enable = true;
  # keyboard layout
  services.xserver.xkb.layout = "us";

  services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
  };

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnome.dconf-editor
  ];

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}