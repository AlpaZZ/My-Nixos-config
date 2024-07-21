# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  imports = [
    ./boot
    ./nixpkgs
    ./nix
    ./networking
    ./hardware
    ./programs
    ./services
    ./security
    ./users
    ./environment
    ./fonts
    ./time
    ./i18n
    ./system
    ./systemd
    ./virtualization
    ./stylix
  ];
}
