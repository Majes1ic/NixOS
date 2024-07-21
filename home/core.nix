{ pkgs, username, ... }:
{
  programs.home-manager.enable = true;

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      unzip
      zip
      tree
      wget
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };

  fonts.fontconfig.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
    };
  };
}
