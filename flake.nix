{
  description = "NixOS configuration";
  inputs = {
    hardware.url = "github:nixos/nixos-hardware/master";
    nixpkgs.url = "github:thoughtfull-systems/nixpkgs/nixos-23.05";
    secrets.url = "git+ssh://git@github.com/pjstadig/nixfiles-secrets";
    thoughtfull = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:thoughtfull-systems/nixfiles/main";
      # url = "/home/paul/src/thoughtfull/nixfiles";
    };
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
