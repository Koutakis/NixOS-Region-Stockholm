{ config, pkgs, ... }:

{
  wsl.defaultUser = "j0vf";
  
  virtualisation.docker.enable = true;
  users.users.j0vf.extraGroups = [ "docker" ];
  
  environment.systemPackages = with pkgs; [
    python312
    python312Packages.pip
    stdenv.cc.cc.lib
    gvfs
    pulseaudio
    wl-clipboard
    xclip
    docker
    ranger
    taskwarrior2
  ];
}
