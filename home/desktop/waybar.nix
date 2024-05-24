{ config, pkgs , lib, ... }:

{
    programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings = {
            bar = {
                layer = "top";
                height = 32;
                margin = "0";
                spacing = 17;

                "hyprland/workspaces" = {
                    on-click = "activate";
                    sort-by-number = true;
                    active-only = false;
                    # format = "{icon}"
                };

                "hyprland/submap" = {
                    format = "{}";
                    max-length = 8;
                    tooltip = false;
                };

                "hyprland/window" = {
                    max-length = 59;
                    separate-outputs = true;
                };

                clock = {
                    interval = 1;
                    format = "{:%H:%M:%S}";
                    format-alt = "{:%e %B %Y}";
                };

                modules-left = [
                    "hyprland/workspaces"
                    "hyprland/submap"
                ];

                modules-center = [
                    "hyprland/window"                   
                ];

                modules-right = [
                    "clock"
                ];
            };
        };
    };
}