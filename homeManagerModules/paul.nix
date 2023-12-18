{ config, lib, ... } : {
  home.file.".config/emacs/init.el".source = ./init.el;
  programs = {
    emacs.extraPackages = epkgs: with epkgs; [
      my-ol-obsidian
      my-org
      my-org-bullets
      my-org-capture
      my-org-faces
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
