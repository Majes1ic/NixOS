{ pkgs, ... }: 
{
  imports = [
    ./core.nix
    ./desktop/hyprland.nix
    #./desktop/rofi.nix
    ./desktop/waybar.nix
  ];

  home.packages = with pkgs; [
    kitty #
    neovim
    micro
    git
    xdg-utils #because vs code doesn't work without it
    vesktop #discord client
    hyprshot #screenshot
  ];

  programs.fuzzel = {
    enable = true;
  };

  services.dunst = {
    enable = true;
  };

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.vscode = {
    enable = true;
    userSettings = {
      # Prevents crash on launch
      "window.titleBarStyle" = "custom";
      "nix.enableLanguageServer" = true;
    };
  };

  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      hwdec = "auto";
    };
  };

  programs.obs-studio.enable = true;

  programs.mangohud = {
    enable = true;
    settings = {
      full = true;
    };
  };
}