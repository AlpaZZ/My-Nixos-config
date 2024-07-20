{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware
      ./boot
      ./users
      ./networking
      ./time-zone
      ./fonts
      ./nixvim
    ];
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.firefox.enable = true;
  programs.direnv.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

  vim
  wget
  vscode
  microsoft-edge
  lshw
  ];

  system.stateVersion = "24.05"; 
}