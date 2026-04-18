{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-master,
      nixos-hardware,
      home-manager,
      nixvim,
      ...
    }:
    let
      arch = "x86_64-linux";

      pkgs = import nixpkgs {
        system = arch;
        config.allowUnfree = true;
      };

    in
    {
      formatter.x86_64-linux = pkgs.nixfmt-tree;
      nixosConfigurations.hrairoo = nixpkgs.lib.nixosSystem {
        system = arch;
        modules = [
          nixos-hardware.nixosModules.framework-12-13th-gen-intel

          {
            nixpkgs.overlays = [
              ./overlays/rnote-master.nix
              #(final: prev: {
              #  rnote = nixpkgs-master.legacyPackages.${arch}.rnote;
              #})
            ];
          }

          ./boot.nix
          ./hardware.nix
          ./packages.nix
          ./system.nix
          ./virt.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-backup";
              users.jarmusz = import ./home-manager { inherit nixvim; };
            };
          }
        ];
      };
    };
}
