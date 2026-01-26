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
      upgrade = "sudo nixos-rebuild switch --flake ~/nixos-config#hq0x";
      modify = "nvim ~/nixos-config/users/hq0x/configuration.nix";
    };
    initExtra = ''
      # Function for quick postgres setup
      pg() {
        if [ -z "$1" ]; then
          echo "Usage: pg <name> [port]"
          return 1
        fi
        local name=$1
        local port=''${2:-5432}
        docker run -d --rm \
          --name "pg-$name" \
          -e POSTGRES_PASSWORD=postgres \
          -e POSTGRES_USER=postgres \
          -p $port:5432 \
          postgres:latest
        echo "Started pg-$name on port $port"
        echo "Connect: postgresql://postgres:postgres@localhost:$port/postgres"
      }
    '';
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

  programs.taskwarrior = {
    enable = true;
    extraConfig = ''
      color=on
      default.command=list
    '';
  };

  home.file.".config/gobang/config.toml".text = ''
    [[conn]]
    type = "postgres"
    name = "local-postgres"
    user = "postgres"
    host = "localhost"
    port = 5432
    database = "postgres"
    password = "postgres"
  '';

  home.file.".config/lazysql/config.toml".text = ''
  [[database]]
  Name = 'local-postgres'
  Provider = 'postgres'
  DBName = 'postgres'
  URL = 'postgres://postgres:postgres@localhost:5432/postgres?sslmode=disable'
  
  [application]
  DefaultPageSize = 100
  DisableSidebar = false
  SidebarOverlay = false
'';
}
