{
  description = "Alpa flake confing";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";

      hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    #Home Manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ...}@inputs:
  let 
    lib = nixpkgs.lib;
  in  {
    nixosConfigurations.nixos-alpa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix
          nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.alpa = import ./home-manager;
            };
          }
        ];
      };
    };
}
