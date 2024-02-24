{
  description = "NixOS configuration";
  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:thoughtfull-systems/home-manager/release-23.11";
    };
    nixpkgs.url = "github:thoughtfull-systems/nixpkgs/nixos-23.11";
    secrets.url = "git+ssh://git@github.com/pjstadig/nixfiles-secrets";
    thoughtfull = {
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
        unstable.follows = "unstable";
      };
      url = "github:thoughtfull-systems/nixfiles/nixos-23.11";
    };
    unstable.url = "github:thoughtfull-systems/nixpkgs/nixpkgs-unstable";
  };
  outputs = { nixos-hardware, nixpkgs, secrets, self, ... }@inputs: {
    homeManagerModules = import ./homeManagerModules;
    nixosConfigurations = {
      hemera = nixpkgs.lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.lenovo-thinkpad-x13
          ./nixos/hemera
        ];
        specialArgs = {
          secrets = secrets.hemera;
          stadig = self.nixosModules;
        };
        system = "x86_64-linux";
      };
      naarah = nixpkgs.lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.raspberry-pi-4
          ./nixos/naarah
        ];
        specialArgs = {
          secrets = secrets.naarah;
          stadig = self.nixosModules;
        };
        system = "aarch64-linux";
      };
      raspi3b = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/raspi3b ];
        specialArgs = {
          secrets = secrets.raspi3b;
          stadig = self.nixosModules;
        };
        system = "aarch64-linux";
      };
      ziph = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/ziph ];
        specialArgs = {
          secrets = secrets.ziph;
          stadig = self.nixosModules;
        };
        system = "x86_64-linux";
      };
    };
    nixosModules = import ./nixosModules inputs;
  };
}
