{inputs, pkgs,, username, ... }: {
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

  # Change default color theme for all GTK4 applications to dark
  home-manager.users.${username}.dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  home-manager.users.${username}.gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}