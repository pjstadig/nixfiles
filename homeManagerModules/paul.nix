{ config, lib, ... } : {
  home.file.".config/emacs/init.el".source = ./init.el;
  programs = {
    git = {
      enable = true;
      userEmail = lib.mkDefault "paul@stadig.name";
      userName = lib.mkDefault "Paul Stadig";
    };
    zsh.enable = true;
  };
  thoughtfull.javascript.enable = true;
}
