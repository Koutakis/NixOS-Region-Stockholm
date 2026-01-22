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
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell"; 
      plugins = [ "git" "docker" "z" ];
    };
    initExtra = ''
    # Source local config if exists (not in git)
    [[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
    '';
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
