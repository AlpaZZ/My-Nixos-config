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
      ../desktop
    ];
  nix.settings.experimental-features = ["nix-command" "flakes"];

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