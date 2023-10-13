{ pkgs, ... } : {
  home = {
    packages = with pkgs; [
      anki-bin
      mpv # needed for audio playback
    ];
  };
}
