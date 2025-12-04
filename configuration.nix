# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  #imports = [
  #  # include NixOS-WSL modules
  #  <nixos-wsl/modules>
  #];

  wsl.enable = true;
  wsl.defaultUser = "hq0x";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
  
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


  ### -- THESE ARE ALL INSTALLED PROGRAMS -- ##  
  environment.systemPackages = with pkgs; [
 
    # OS LEVEL SHIT
    vim 
    wget
    git
    gvfs # auto mount of incerted disks
    pipewire # Sound I think
    pavucontrol
    wireplumber #sound I think   
    pulseaudio
    grim      # Screenshot tool
    slurp     # Region selector
    wl-clipboard  # Copy to clipboard
 
    # TUI
    ranger
    btop
    tree
    neovim
    # pipewire and wireplumber), nerd font,

    
  ];
}
