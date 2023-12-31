{ config, lib, ... } : {
  home.file.".config/emacs/init.el".source = ./init.el;
  programs = {
    emacs.extraPackages = epkgs: with epkgs; [
      tfl-gtd
      tfl-ol-obsidian
      tfl-org
      tfl-org-bullets
      tfl-org-capture
      tfl-org-faces
    ];
    git = {
      enable = true;
      userEmail = lib.mkDefault "paul@stadig.name";
      userName = lib.mkDefault "Paul Stadig";
    };
    zsh.enable = true;
  };
  thoughtfull = {
    emacs.gtd.enable = true;
    javascript.enable = true;
  };
}
