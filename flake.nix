{    nixosConfigurations.borat = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.wsl
        ./common/wsl.nix
        ./users/borat/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.borat = import ./users/borat/home.nix;
        }
      ];
    };
  description = "NixOS WSL development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }: {
    # hq0x
    nixosConfigurations.hq0x = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.wsl
        ./common/wsl.nix
        ./users/hq0x/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.hq0x = import ./users/hq0x/home.nix;
        }
      ];
    };

    # Borat
    nixosConfigurations.borat = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.wsl
        ./common/wsl.nix
        ./users/borat/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.borat = import ./users/borat/home.nix;
        }
      ];
    };
   
    # Axel Rönngren
    nixosConfigurations.j0vf = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.wsl
        ./common/wsl.nix
        ./users/j0vf/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.j0vf = import ./users/j0vf/home.nix;
        }
      ];
    };
  };
}
