{ config, pkgs, ... }:

{
  wsl.defaultUser = "borat";
  
  virtualisation.docker.enable = true;
  users.users.borat.extraGroups = [ "docker" ];
  services.k3s.enable = true;
  
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
