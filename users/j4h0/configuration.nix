{ config, pkgs, ... }:

{
  wsl.defaultUser = "j4h0";

  virtualisation.docker.enable = true;
  users.users.j4h0.extraGroups = [ "docker" ];

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

