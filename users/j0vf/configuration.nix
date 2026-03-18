{ config, pkgs, ... }:

{
  wsl.defaultUser = "j0vf";
  
  virtualisation.docker.enable = true;
  services.k3s.enable = true;
  users.users.j0vf.extraGroups = [ "docker" ];
  
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
    kubernetes-helm
    jq
  ];
}
