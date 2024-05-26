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
      nil
    ];
  };

  home.stateVersion = "23.05";
}