# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{

  programs.nix-ld.enable = true; # This makes NixOS capable to open vs code
  wsl.enable = true;
  wsl.defaultUser = "hq0x";

  system.stateVersion = "25.05"; # Did you read the comment?
  
  # This ensures that old versions of NixOS does not keep filling up
  # disk space. This setting is now done so that old versions are deleted
  # automatically ofter 14 days
  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 14d";
  };

  nix.settings.auto-optimise-store = true;


  # Enabling flakes and other experimental featutes here
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # timezone
  time.timeZone = "Europe/Stockholm";
  
  programs.zsh = {
    enable = true;
  };

  # This allows unfree packages
  nixpkgs.config.allowUnfree = true;

  # makes zsh the default shell
  users.defaultUserShell = pkgs.zsh;

  # Docker settings
  virtualisation.docker.enable = true; # Starts daemon
  users.users.hq0x.extraGroups = [ "docker" ]; # Removes sudo form docker stuff

  ### -- THESE ARE ALL INSTALLED PROGRAMS -- ##  
  environment.systemPackages = with pkgs; [
    # PYHTON
    python312
    python312Packages.pip
    stdenv.cc.cc.lib # this enables the use of numpy and pandas

    # OS things
    vim 
    wget
    git
    gvfs # auto mount of incerted disks   
    pulseaudio
    wl-clipboard  # Copy to clipboard
    docker


    # TUI
    ranger # file explorer
    btop # task manager
    tree # lightweight file manager
    neovim # text editor
    taskwarrior2 # Taks manager
    tldr # better help
    bat # better cat 
  ];
}
