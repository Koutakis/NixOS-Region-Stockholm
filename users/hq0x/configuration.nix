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
    ranger
    taskwarrior2
  ];
}