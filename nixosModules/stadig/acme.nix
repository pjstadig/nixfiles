{ lib, ... } : {
  security.acme.defaults.email = lib.mkDefault "paul@thoughtfull.systems";
}
