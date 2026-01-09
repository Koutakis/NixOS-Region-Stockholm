{ config, pkgs, ... }:

{
  programs.nix-ld.enable = true;
  wsl.enable = true;
  
  system.stateVersion = "25.05";
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  time.timeZone = "Europe/Stockholm";
  
  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
  users.defaultUserShell = pkgs.zsh;
  
  # Common packages everyone needs
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    neovim
    tree
    btop
    bat
    tldr
  ];
}