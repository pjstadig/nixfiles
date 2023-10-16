inputs : {
  default = import ./stadig inputs;
  home = inputs.self.homeManagerModules;
  paul = import ./paul.nix;
}
