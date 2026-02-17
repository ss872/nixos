{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.sshyam = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          inputs.nixos-hardware.nixosModules.framework-13-7040-amd
          inputs.home-manager.nixosModules.home-manager
          ./hosts/fw13/configuration.nix
        ];
      };
    };
}
