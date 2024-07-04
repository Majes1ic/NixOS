{ pkgs, ... }:
{
  imports = [
    ./core.nix
    ./programs/vscode.nix
  ];

  home.packages = with pkgs; [
    kitty
    neovim
    micro
    git
    xdg-utils         # because vs code doesn't work without it
    vesktop           # discord client
    prismlauncher
    bitwarden-desktop
    heroic
    lutris
    stremio
    qbittorrent
    qpwgraph          # audio piping (patch panel)
  ];

  programs.firefox.enable = true;
  # added as firefox broken on nvidia 555
  programs.chromium.enable = true;
  programs.obs-studio.enable = true;
  
  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      hwdec = "auto";
    };
  };

  programs.mangohud = {
    enable = true;
    settings = {
      full = true;
    };
  };
}
