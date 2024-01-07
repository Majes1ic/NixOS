{ username, pkgs, ... }: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "${username}";
      };
    };
  };

  # Enable gnome keyring for saving login credentials in apps such as vscode
  # Works with greetd through pam
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd = {
    startSession = true;
    enableGnomeKeyring = true;
  };
}