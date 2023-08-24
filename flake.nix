{
  description = "NixOS configuration";
  inputs = {
    agenix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:ryantm/agenix/e64961977f60388dd0b49572bb0fc453b871f896";
    };
    hardware.url = "github:nixos/nixos-hardware/master";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:thoughtfull-systems/home-manager/release-23.05";
    };
    nixpkgs.url = "github:thoughtfull-systems/nixpkgs/nixos-23.05";
    secrets.url = "git+ssh://git@github.com/thoughtfull-systems/nixfiles-secrets";
    thoughtfull = {
      inputs = {
        agenix.follows = "agenix";
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
        unstable.follows = "unstable";
      };
      url = "github:thoughtfull-systems/nixfiles/main";
    };
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { hardware, nixpkgs, secrets, self, thoughtfull, ... }@inputs: {
    homeManagerModules = import ./homeManagerModules;
    nixosConfigurations = {
      hemera = nixpkgs.lib.nixosSystem {
        modules = [
          hardware.nixosModules.lenovo-thinkpad-x13
          ./nixos/hemera
        ];
        specialArgs = {
          secrets = secrets.hemera;
          stadig = self.nixosModules;
          thoughtfull = thoughtfull.nixosModules;
        };
        system = "x86_64-linux";
      };
      raspi3b = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/raspi3b ];
        specialArgs = {
          secrets = secrets.raspi3b;
          stadig = self.nixosModules;
          thoughtfull = thoughtfull.nixosModules;
        };
        system = "aarch64-linux";
      };
      ziph = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/ziph ];
        specialArgs = {
          secrets = secrets.ziph;
          stadig = self.nixosModules;
          thoughtfull = thoughtfull.nixosModules;
        };
        system = "x86_64-linux";
      };
    };
    nixosModules = import ./nixosModules inputs;
  };
}
