{
    services.waybar = {
        enable = true

        package = (pkgs.waybar.overrideAttrs (o: {
            version = "2024-02-23";
            buildInputs = o.buildInputs ++ [ pkgs.pipewire ];

            src = pkgs.fetchFromGitHub {
                owner = "Alexays";
                repo = "Waybar";
                rev = "793394c862b7ed1b2892d8815101a4567373092c";
                hash = "sha256-VryxmTIxBnLRmpVfYYMl0WyJFLz0OJFaVMFp6W0rSdc=";
            };

            mesonFlags = (remove "-Dgtk-layer-shell=enabled" o.mesonFlags)
                ++ lib.mapAttrsToList lib.mesonEnable {
                "libevdev" = false;
            };
            }));

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

                gamemode = mkIf gamemode.enable {
                    format = "{glyph} Gamemode";
                    format-alt = "{glyph} Gamemode";
                    glyph = "<span color='#${colors.base04}'>󰊴</span>";
                    hide-not-running = true;
                    use-icon = false;
                    icon-size = 0;
                    icon-spacing = 0;
                    tooltip = false;
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



        style = /*css*/ ''
        '';

    }
}