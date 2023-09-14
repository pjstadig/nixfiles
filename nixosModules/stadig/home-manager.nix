{ stadig, ... }: {
  home-manager = {
    extraSpecialArgs.stadig = stadig.home;
    sharedModules = [ stadig.home.stadig ];
  };
}
