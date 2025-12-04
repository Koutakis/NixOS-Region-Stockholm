{ config, pkgs, ... }:
{
  home.stateVersion = "25.05";
  
  home.packages = with pkgs; [
    # User-level packages
  ];

  programs.git = {
    enable = true;
    userName = "Koutakis";
    userEmail = "alexander.koutakis00@gmail.com";
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
}
