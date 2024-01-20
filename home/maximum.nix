{ pkgs, ... }: 
{
  imports = [
    ./core.nix
    ./desktop/hyprland.nix
    ./desktop/rofi.nix
  ];

  home.packages = with pkgs; [
    kitty
    neovim
    micro
    git
  ];
  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.vscode = {
    enable = true;
    userSettings = {
      # Prevents crash on launch
      "window.titleBarStyle" = "custom";
    };
  };
  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      hwdec = "auto";
    };
  };
}