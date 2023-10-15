{ config, lib, ... } : {
  home = {
    file.".config/emacs/init.el".source = ./init.el;
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = lib.mkDefault "22.11";
  };
  programs = {
    git = {
      enable = true;
      userEmail = lib.mkDefault "paul@stadig.name";
      userName = lib.mkDefault "Paul Stadig";
    };
    zsh.enable = true;
  };
}
