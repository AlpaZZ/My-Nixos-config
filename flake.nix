{
  description = "ZaneyOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #Home Manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
      rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
    # This is required for plugin support.
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
  };

    outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs outputs;
          };
          # > Our main nixos configuration file <
          modules = [
            ./nixos/config.nix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                users.alpa = import ./home-manager;
                extraSpecialArgs = {
                  inherit inputs outputs;
                };
              };
            }
            (
              { pkgs, ... }:
              {
                nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
                environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
              }
            )
            inputs.stylix.nixosModules.stylix
          ];
        };
      };
    };
}

