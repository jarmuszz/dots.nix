{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";

      pkgs = import inputs.nixpkgs {
        system = system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [ "electron-25.9.0" ];
        };
      };

    in {
      nixosConfigurations.acorn = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./system.nix
          ./packages.nix
          ./desktop.nix
          ./hardware.nix
          ./virt.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-t480s

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."jarmusz" = ./home-manager;
            };
          }
        ];
      };
    };
}
