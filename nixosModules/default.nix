inputs : {
  default = import ./stadig;
  home = inputs.self.homeManagerModules;
  paul = import ./paul.nix;
}
