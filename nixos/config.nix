{
  config,
  pkgs,
  options,
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

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
    disabledDefaultBackends = [ "escl" ];
  };


  # Optimization settings and garbage collection automation
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

}
