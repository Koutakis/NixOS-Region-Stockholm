{ config, pkgs, ... }:

{
  wsl.defaultUser = "hq0x";
  
  virtualisation.docker.enable = true;
  users.users.hq0x.extraGroups = [ "docker" ];
  
  environment.systemPackages = with pkgs; [
    python312
    python312Packages.pip
    stdenv.cc.cc.lib
    gvfs
    pulseaudio
    wl-clipboard
    docker
    gobang # trash bin
    lazysql
    ranger
    taskwarrior2
    _1password-cli
    nmap # pi stuff natowrking i think its lata ok?!?!?
  ];
}
