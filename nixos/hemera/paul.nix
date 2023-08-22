{ stadig, ... }: {
  home-manager.users.paul.imports = [ ../../home/hemera/paul.nix ];
  imports = [ stadig.paul ];
  users.users.paul = {
    extraGroups = [ "libvirtd" ];
    hashedPassword = "$6$D8BE3vSdfspUXA7f$fDLrPf8/qbkAGtsqoiVJt.hXKTFWqkBEXMgof29GflBA/nmBlbpDTaOrwC.ZZrYOhTTM1a14kRusGcidxkIzN1";
  };
}
