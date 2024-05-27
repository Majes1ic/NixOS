{ pkgs, username, ... }: {
  # keyboard layout
  services.xserver.xkb.layout = "us";

  programs.dconf.enable = true;

  # Attempt to disable gnome power profiles
  powerManagement.enable = false;
  services.power-profiles-daemon.enable = false;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnome.dconf-editor
  ];

  home-manager.users.${username} = {
    # Change default color theme for all GTK4 applications to dark
    dconf = {
      enable = true;
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };

    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };
  };

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}
