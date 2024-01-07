{ pkgs, ... }: {
  imports = [
    ./core.nix
    ./desktop/hyprland.nix
    ./desktop/rofi.nix
  ];

  home.packages = with pkgs; [
    kitty
    webcord
    firefox
    neovim
    micro
    git
  ];
  programs.zsh.enable = true;
  programs.vscode = {
    enable = true;
    userSettings = {
      # Prevents crash on launch
      "window.titleBarStyle" = "custom";
    };
  };
}
