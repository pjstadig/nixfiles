{ ... } : {
  programs.ssh = {
    extraConfig = ''
      Host unlock.naarah.lan
        Hostname naarah.lan
        Port 222
      Host unlock.raspi3b.lan
        Hostname raspi3b.lan
        Port 222
      Host tmux.raspi3b.lan
        Hostname raspi3b.lan
        RequestTTY yes
        RemoteCommand tmux att || tmux new
    '';
    knownHosts = {
      "hemera.lan".publicKey = builtins.readFile ./ssh/hemera.pub;
      "raspi3b.lan".publicKey = builtins.readFile ./ssh/raspi3b.pub;
    };
  };
}
