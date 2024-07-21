# peripheral.nix for configuring other peripheral related like audio, input, etc.
{config, pkgs, ...}:

{

  # Configure keymap in X11.
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to document printings.
  services.printing.enable = true;

  # Bluetooth configurations
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  # Enable sound with pipewire.
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  security.polkit.enable = true;

}