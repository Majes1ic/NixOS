{ lib, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.protontricks ];

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  # So that protontricks can find proton-ge
  environment.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS =
    lib.makeSearchPathOutput "steamcompattool" "" [ pkgs.proton-ge-bin ];
}
