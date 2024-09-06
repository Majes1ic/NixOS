{ pkgs, ... }:
{
  imports = [
    ./core.nix
    ./programs/vscode.nix
  ];

  home.packages = with pkgs; [
    kitty
    micro
    git
    xdg-utils # because vs code doesn't work without it
    vesktop # discord client
    discord
    prismlauncher
    bitwarden-desktop
    heroic
    lutris
    stremio
    qbittorrent
    qpwgraph # audio piping (patch panel)
    lua
    zed-editor
    godot_4
    love
    gnomeExtensions.easyeffects-preset-selector
    easyeffects
    jellyfin-mpv-shim
    jellyfin-media-player
  ];

  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      # Runtime dependencies
      fzf
      lua-language-server
      nixd
      nil
      stylua
      nixfmt-rfc-style
      ripgrep
      gnumake
      gcc
      luajit
    ];
  };

  programs.firefox = {
    enable = true;
  };

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
