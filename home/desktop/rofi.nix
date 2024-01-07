{
  programs.rofi.enable = true;
  wayland.windowManager.hyprland.settings.bindr = [
    #"SUPER, SUPER_L, exec, pkill rofi \|\| rofi"
    "SUPER, SUPER_L, exec, rofi"
  ];
}