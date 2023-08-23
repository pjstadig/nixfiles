{
  description = "NixOS configuration";
  inputs = {
    hardware.url = "github:nixos/nixos-hardware/master";
    nixpkgs.url = "github:thoughtfull-systems/nixpkgs/nixos-23.05";
    secrets.url = "git+ssh://git@github.com/thoughtfull-systems/nixfiles-secrets";
    thoughtfull = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:thoughtfull-systems/nixfiles/main";
    };
  };
  outputs = { hardware, nixpkgs, secrets, thoughtfull, ... }@inputs: rec {
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
          thoughtfull = thoughtfull.nixosModules;
        };
        system = "x86_64-linux";
      };
      raspi3b = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/raspi3b ];
        specialArgs = {
          secrets = secrets.raspi3b;
          stadig = nixosModules;
          thoughtfull = thoughtfull.nixosModules;
        };
        system = "aarch64-linux";
      };
      ziph = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/ziph ];
        specialArgs = {
          secrets = secrets.ziph;
          stadig = nixosModules;
          thoughtfull = thoughtfull.nixosModules;
        };
        system = "x86_64-linux";
      };
    };
    nixosModules = import ./nixosModules inputs;
  };
}
