{ config, pkgs, ... }:
{
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    tmux
  ];
  
  programs.git = {
    enable = true;
    userName = "axelronngren";
    userEmail = "axelronngren@outlook.com";
  };
  
  programs.zsh = {
    enable = true;
    initExtra = builtins.readFile ./zshrc;
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
  
  programs.taskwarrior = {
    enable = true;
    extraConfig = ''
      color=on
      default.command=list
    '';
  };
}
