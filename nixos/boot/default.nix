{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub.devices = ["nodev"];
      grub.efiSupport = true;
      grub.useOSProber = true;
    };
    supportedFilesystems = ["ntfs"];
  };
}