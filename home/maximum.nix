{ pkgs, ... }: 
{
  imports = [
    ./core.nix
    ./programs/vscode.nix
  ];

  home.packages = with pkgs; [
    kitty #
    neovim
    micro
    git
    xdg-utils #because vs code doesn't work without it
    vesktop #discord client
    prismlauncher
    bitwarden
  ];

  # programs.fuzzel = {
  #   enable = true;
  # };

  # services.dunst = {
  #   enable = true;
  # };

  programs.firefox.enable = true;
  #added as firefox broken on nvidia 555
  programs.chromium.enable = true;
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