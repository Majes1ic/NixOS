{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    # Add vscode packages such as language servers here
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      nil
    ]);

    userSettings = {
      # Prevents crash on launch
      "window.titleBarStyle" = "custom";
      "nix.enableLanguageServer" = true;
    };
  };
}
