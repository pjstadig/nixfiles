{
  description = "NixOS configuration";
  inputs = {
    hardware.url = "github:nixos/nixos-hardware/master";
    nixfiles = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:thoughtfull-systems/nixfiles/main";
    };
    nixpkgs.url = "github:thoughtfull-systems/nixpkgs/nixos-23.05";
    secrets.url = "git+ssh://git@github.com/thoughtfull-systems/nixfiles-secrets";
  };
  outputs = { hardware, nixfiles, nixpkgs, secrets, ... }@inputs: rec {
    homeManagerModules = import ./homeManagerModules;
    nixosConfigurations = {
      hemera = nixpkgs.lib.nixosSystem {
        modules = [
          hardware.nixosModules.lenovo-thinkpad-x13
          ./nixos/hemera
        ];
        specialArgs = {
          secrets = secrets.hemera;
          stadig = nixosModules;
          thoughtfull = nixfiles.nixosModules;
        };
        system = "x86_64-linux";
      };
      raspi3b = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/raspi3b ];
        specialArgs = {
          secrets = secrets.raspi3b;
          stadig = nixosModules;
          thoughtfull = nixfiles.nixosModules;
        };
        system = "aarch64-linux";
      };
      ziph = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/ziph ];
        specialArgs = {
          secrets = secrets.ziph;
          stadig = nixosModules;
          thoughtfull = nixfiles.nixosModules;
        };
        system = "x86_64-linux";
      };
    };
    nixosModules = import ./nixosModules;
  };
}
