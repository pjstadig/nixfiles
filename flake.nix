{
  description = "NixOS configuration";
  inputs = {
    hardware.url = "github:nixos/nixos-hardware/master";
    nixpkgs.url = "github:thoughtfull-systems/nixpkgs/nixos-23.05";
    # nixpkgs.url = "/home/paul/src/thoughtfull/nixpkgs";
    secrets.url = "git+ssh://git@github.com/pjstadig/nixfiles-secrets";
    thoughtfull = {
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.unstable.follows = "unstable";
      url = "github:thoughtfull-systems/nixfiles/main";
      # url = "/home/paul/src/thoughtfull/nixfiles";
    };
    unstable.url = "github:thoughtfull-systems/nixpkgs/nixos-unstable";
  };
  outputs = { hardware, nixpkgs, secrets, self, ... }@inputs: {
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
        };
        system = "x86_64-linux";
      };
      naarah = nixpkgs.lib.nixosSystem {
        modules = [
          hardware.nixosModules.raspberry-pi-4
          ./nixos/naarah
        ];
        specialArgs = {
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
