{ pkgs, username, ... }: {
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

  home.stateVersion = "23.05";
}
