{ lib, pkgs, username, ... }:
let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    dash-to-dock
    night-theme-switcher
  ];
in
{
  # Disable gnome power profile functionality
  services.upower.enable = lib.mkForce false;
  services.power-profiles-daemon.enable = lib.mkForce false;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = extensions ++ (with pkgs.gnome; [
    dconf-editor
    gnome-tweaks
  ]);

  # To workaround crashing, temporarily force Firefox to use xwayland.
  # Remove once these issues get resolved:
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/3504
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1898476
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = 0;

  # Enables wayland support in Chromium and Electron based applications. Until
  # the above firefox bug is fixed, this breaks link opening from discord as
  # interactions between wayland and xwayland apps do not work.
  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  home-manager.users.${username} = {
    # Change default color theme for all GTK4 applications to dark
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };

        "org/gnome/desktop/peripherals/mouse" = {
          accel-profile = "flat";
        };

        "org/gnome/desktop/wm/preferences" = {
          action-middle-click-titlebar = "toggle-maximize-vertically";
          button-layout = "appmenu:minimize,close";
          # Focus follows mouse
          focus-mode = "sloppy";
          resize-with-right-button = true;
        };

        "org/gnome/mutter" = {
          edge-tiling = true;
        };

        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = true;
          night-light-schedule-automatic = true;
        };

        # Allow apps to use location for sunrise/sunset time
        "org/gnome/system/location" = {
          enabled = true;
        };

        "org/gnome/settings-daemon/plugins/power" = {
          # Set power button to power off system
          power-button-action = "interactive";
          # Disable inactive suspend
          sleep-inactive-ac-type = "nothing";
        };

        "org/gnome/shell" = {
          # Enable our installed extenions and some of the pre-installed ones
          enabled-extensions = (map (e: e.extensionUuid) extensions) ++ [
            "drive-menu@gnome-shell-extensions.gcampax.github.com"
            "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
          ];
        };

        "org/gnome/shell/extensions/nightthemeswitcher/commands" = {
          enabled = true;
          sunset = "gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice";
          sunrise = "gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic";
        };

        "org/gnome/shell/extensions/dash-to-dock" = {
          click-action = "focus-or-appspread";
          scroll-action = "cycle-windows";
          apply-custom-theme = true;
          show-trash = false;
        };
      };
    };

    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };

    home.pointerCursor = {
      gtk.enable = true;
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}
