{ lib, pkgs, ...}:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = [ pkgs.pavucontrol ];

  hardware.pulseaudio.enable = lib.mkForce false;

  # Reduces latency in some situations
  security.rtkit.enable = true;
}
