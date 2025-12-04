{ config, pkgs, ... }:
{
  imports = [
    ./home/shell.nix
  ];
  
  home.stateVersion = "25.05";
  
  home.packages = with pkgs; [
    tmux
  ];
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "Koutakis";
      user.email = "alexander.koutakis00@gmail.com";
    };
  };
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" ];
      theme = "robbyrussell";
    };
    shellAliases = {
      upgrade = "sudo nixos-rebuild switch --flake ~/nixos-config#wsl";
      modify = "nvim ~/nixos-config/configuration.nix";
    };
    history.size = 10000;
    history.path = "$HOME/.zsh_history";
  };

  programs.tmux = {
  enable = true;
  terminal = "screen-256color";
  keyMode = "vi";
  plugins = with pkgs.tmuxPlugins; [
    sensible
    vim-tmux-navigator
  ];
  extraConfig = ''
    set -g mouse on
    bind | split-window -h
    bind - split-window -v
  '';
  };
}
