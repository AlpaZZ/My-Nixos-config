{
  config,
  pkgs,
  options,
  self,
  ...
}:

{
  imports = [
    ./boot
    ./hardware
    ./users
    ./networking
    ./services
    ./stylix
    ./time-zone
    ./fonts
    ./programs
    ./security
    ./system
    ./nixpkgs

  ];

  


}
