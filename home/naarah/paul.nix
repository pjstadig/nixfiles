{ stadig, ... }: {
  home.stateVersion = "22.05";
  imports = [
    stadig.paul
  ];
  programs = {
    git = {
      userEmail = "paul@stadig.name";
      userName = "Paul Stadig";
    };
    tmux.enable = true;
  };
}
