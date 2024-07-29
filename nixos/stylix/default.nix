{ pkgs, lib, ... }:
{
    stylix = {
    enable = true;
    image = ../../wallpapers/animeskull.png;
    # base16Scheme = {
    #   base00 = "232136";
    #   base01 = "2a273f";
    #   base02 = "393552";
    #   base03 = "6e6a86";
    #   base04 = "908caa";
    #   base05 = "e0def4";
    #   base06 = "e0def4";
    #   base07 = "56526e";
    #   base08 = "eb6f92";
    #   base09 = "f6c177";
    #   base0A = "ea9a97";
    #   base0B = "3e8fb0";
    #   base0C = "9ccfd8";
    #   base0D = "c4a7e7";
    #   base0E = "f6c177";
    #   base0F = "56526e";
    # };
        fonts = {
      sizes = {
        applications = 10;
        desktop = 10;
        popups = 10;
        terminal = 13;
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter Variable";
      };
      monospace = {
        package = (
          pkgs.nerdfonts.override {
            fonts = [
              "JetBrainsMono"
              "RobotoMono"
            ];
          }
        );
        name = "RobotoMono Nerd Font Propo";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS-Monterey";
      size = 32;
    };
    opacity.terminal = 0.55;
    targets = {
      nixvim.enable = lib.mkForce false;
    };
  };
}
