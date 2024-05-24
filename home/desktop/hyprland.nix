{inputs, pkgs, ... }: {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];
  home.packages = with pkgs; [
    wl-clipboard
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP=Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP=Hyprland"
        "WLR_NO_HARDWARE_CURSORS,1"
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      monitor = [
        "HDMI-A-1,2560x1440@75,0x0,1"
        "DP-2,2560x1440@360,2560x0,1"
      ];

      input = {
        kb_layout = "us";
      };
      
      bind = [
        "SUPER, Return, exec, ${pkgs.kitty}/bin/kitty"
      ];

#      When VRR fixed for 2 monitors, uncomment
#      misc = {
#        vrr = 1;
#      };
    };
    extraConfig = builtins.readFile ./hyprland.conf;
  };
}
