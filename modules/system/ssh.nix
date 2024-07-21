{ username, ...}:
{
  services.openssh = {
    enable = true;
    openFirewall = false;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = [ username ];
    };

    hostKeys = [{
      path = "/etc/ssh/ssh_host_ed25519_key";
      type = "ed25519";
    }];
  };

  networking.firewall.interfaces = {
    #wg-discord.allowedTCPPorts = [22];
    wg-home.allowedTCPPorts = [22];
    enp3s0.allowedTCPPorts = [22];
  };

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFqX+SdocMJggapFzaSHcwcua4qU3VNjshhchJB0b5Lh tomawdry@proton.me"
  ];
}
