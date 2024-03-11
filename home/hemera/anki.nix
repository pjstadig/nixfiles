{ pkgs, ... } : {
  home = {
    packages = with pkgs; [
      unstable.anki-bin
      mpv # needed for audio playback
    ];
  };
}
