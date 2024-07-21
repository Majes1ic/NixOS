{ pkgs, username, ... }: {
  environment.systemPackages = with pkgs; [ wireguard-tools ];
	networking.wg-quick.interfaces = {
    wg-discord = {
      # Unlike the allowedIPs setting, the subnet mask here (/24) doesn't
      # represent a group of 256 IP addresses, it represents the network
      # mask for the interface. Since the subnet mask is 255.255.255.0, it
      # tells the interface that other devices on the network will have IP
      # addresses in that range. It is used for routing to determine if a
      # destination IP address is on the same network and if it can be directly
      # communicated with rather than going through the default gateway.
      address = [ "10.0.0.6/24" ];
      autostart = false;
      privateKeyFile = "/home/${username}/.wireguard/private";
      dns = ["10.0.0.7"];
      peers = [
        {
          publicKey = "PbFraM0QgSnR1h+mGwqeAl6e7zrwGuNBdAmxbnSxtms=";
          allowedIPs = [ "10.0.0.0/24" ];
          endpoint = "ddns.manch.tech:13232";
          persistentKeepalive = 25;
        }
      ];
    };
    wg-home = {
      address = ["10.0.1.1/24"];
      listenPort = 51820;
      autostart = true;
      privateKeyFile = "/home/${username}/.wireguard/private";
      peers = [
        {
          #for laptop
          publicKey = "T1EHPg4tkmQ1KFWGzspBYAkjzLL1JzWTNtPsSkObLUE=";
          allowedIPs = ["10.0.1.2/32"];
        }
        {
          #for phone
          publicKey = "xDDnUvzTcSGA4htsmYBSQykgLVv/MCEUwEKc+IOoL3w=";
          allowedIPs = ["10.0.1.3/32"];
        }
      ];
    };
  };
  networking.firewall.interfaces.wg-discord = {
    # For OBS screensharing
    allowedUDPPorts = [ 5201 ];
  };
  networking.firewall.allowedUDPPorts = [ 51820 ];

  programs.zsh = {
    shellAliases = {
      wg-discord-up = "sudo systemctl start wg-quick-wg-discord";
      wg-discord-down = "sudo systemctl stop wg-quick-wg-discord";
      wg-home-up = "sudo systemctl start wg-quick-wg-home";
      wg-home-down = "sudo systemctl stop wg-quick-wg-home";
    };
  };
}
