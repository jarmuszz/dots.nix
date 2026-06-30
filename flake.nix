{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-scratchpad-flake = {
      url = "github:gvolpe/niri-scratchpad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixos-hardware,
      home-manager,
      nixvim,
      nixos-wsl,
      ...
    }@inputs:
    let
      arch = "x86_64-linux";

      pkgs = import nixpkgs {
        system = arch;
        config.allowUnfree = true;
      };

    in
    {
      formatter.x86_64-linux = pkgs.nixfmt-tree;
      nixosConfigurations = {
        hrairoo = nixpkgs.lib.nixosSystem {
          system = arch;
          specialArgs = { inherit inputs; };
          modules = [
            nixos-hardware.nixosModules.framework-12-13th-gen-intel

            ./overlays

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

        silver = nixpkgs.lib.nixosSystem {
          system = arch;

          modules = [
            nixos-wsl.nixosModules.default

            {
              wsl = {
                enable = true;
                defaultUser = "jarmusz";
              };

              environment.systemPackages = with pkgs; [
                neovim
                waypipe
                calc
                dig
                htop
                zip
              ];


              nix = {
                extraOptions = ''
                  experimental-features = nix-command flakes
                  auto-optimise-store = true
                  keep-outputs = true
                '';
              };


              system.stateVersion = "25.05";
            }
            
          ];
        };
      };
    };
}
