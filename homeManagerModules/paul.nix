{ config, lib, ... } : {
  home.file.".config/emacs/init.el".source = ./init.el;
  programs = {
    emacs.extraPackages = epkgs: with epkgs; [
      pjs-gtd
      pjs-ol-obsidian
      pjs-org
      pjs-org-bullets
      pjs-org-capture
      pjs-org-faces
    ];
    git = {
      enable = true;
      userEmail = lib.mkDefault "paul@stadig.name";
      userName = lib.mkDefault "Paul Stadig";
    };
    zsh.enable = true;
  };
  thoughtfull.javascript.enable = true;
}
