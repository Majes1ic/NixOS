{ lib, pkgs, username, ... }:
{
  # Disable gnome power profile functionality
  services.upower.enable = lib.mkForce false;
  services.power-profiles-daemon.enable = lib.mkForce false;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnome.dconf-editor
  ];

  # To workaround crashing, temporarily force Firefox to use xwayland.
  # Remove once these issues get resolved:
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/3504
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1898476
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = 0;

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
