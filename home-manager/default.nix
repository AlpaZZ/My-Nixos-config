{ inputs, config, pkgs, ... }:
{
  imports = [
    ./programs
    ./wayland
    ./gtk
    ./nixpkgs
  ];
  home.username = "alpa";
  home.homeDirectory = "/home/alpa";
  home.stateVersion = "24.05"; 
  programs.home-manager.enable = true;
}
