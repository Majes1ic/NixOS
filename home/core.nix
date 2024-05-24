{ username, pkgs, ... }: {
  programs.home-manager.enable = true;
  
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      unzip
      zip
      tree
      wget
    ];
  };

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

  home.stateVersion = "23.05";
}