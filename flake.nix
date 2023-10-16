{
  description = "NixOS configuration";
  inputs = {
    hardware.url = "github:nixos/nixos-hardware/master";
    secrets.url = "git+ssh://git@github.com/pjstadig/nixfiles-secrets";
    thoughtfull.url = "github:thoughtfull-systems/nixfiles/main";
    # thoughtfull.url = "/home/paul/src/thoughtfull/nixfiles";
  };
  outputs = { hardware, secrets, self, thoughtfull, ... }@inputs: {
    homeManagerModules = import ./homeManagerModules;
    nixosConfigurations = {
      hemera = thoughtfull.inputs.nixpkgs.lib.nixosSystem {
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
      raspi3b = thoughtfull.inputs.nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/raspi3b ];
        specialArgs = {
          secrets = secrets.raspi3b;
          stadig = self.nixosModules;
          thoughtfull = thoughtfull.nixosModules;
        };
        system = "aarch64-linux";
      };
      ziph = thoughtfull.inputs.nixpkgs.lib.nixosSystem {
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
