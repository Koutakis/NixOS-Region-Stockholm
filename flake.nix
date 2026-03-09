{
  description = "NixOS WSL development environment";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }:
  let
    mkUser = username: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.wsl
        ./common/wsl.nix
        ./users/${username}/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./users/${username}/home.nix;
        }
      ];
    };
  in {
    nixosConfigurations = {
      hq0x  = mkUser "hq0x";
      borat = mkUser "borat";
      j0vf  = mkUser "j0vf";
      j4h0  = mkUser "j4h0";
    };
  };
}
