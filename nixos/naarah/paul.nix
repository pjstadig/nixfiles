{ stadig, ... }: {
  home-manager.users.paul.imports = [ ../../home/naarah/paul.nix ];
  imports = [ stadig.paul ];
  users.users.paul = {
    hashedPassword = "$6$T4KL55dQakhZUUX8$xB8CBw7N8U1/VCSODyZ0qAGJSoEEUBP5trWN17wcFHXxrH448kumGGON8s4ruUgqEWdV7I.MMc41LDuZmRkl9.";
  };
}
