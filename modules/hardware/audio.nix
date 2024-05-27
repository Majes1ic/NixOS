{ lib, ... }:
{
  hardware.bluetooth.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Reduces latency in some situations
  security.rtkit.enable = true;
}
