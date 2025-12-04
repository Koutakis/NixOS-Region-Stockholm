# NixOS Development Environment - Stockholm Region

Reproducible NixOS WSL configuration for developers.

## Prerequisites

- Windows with WSL2 installed
- NixOS-WSL installed ([instructions](https://github.com/nix-community/NixOS-WSL))

## Setup

Clone and apply configuration:
```bash
git clone git@github.com:Koutakis/NixOS-Region-Stockholm.git ~/nixos-config
sudo nixos-rebuild switch --flake ~/nixos-config#wsl
```

Reboot or restart your WSL instance.

## Making Changes

Edit system configuration:
```bash
sudo nvim ~/nixos-config/configuration.nix
```

Apply changes:
```bash
sudo nixos-rebuild switch --flake ~/nixos-config#wsl
```

Commit and push:
```bash
cd ~/nixos-config
git add .
git commit -m "Description of changes"
git push
```

## Updating Dependencies

Update to latest nixpkgs and dependencies:
```bash
cd ~/nixos-config
nix flake update
sudo nixos-rebuild switch --flake ~/nixos-config#wsl
git add flake.lock
git commit -m "Update flake.lock"
git push
```

## What's Included

- Zsh with oh-my-zsh
- Neovim, ranger, btop
- Development tools (git, wget)
- AND LOTS MORE!

## Troubleshooting

If rebuild fails, check error message and verify `configuration.nix` syntax.

For package name changes, search [NixOS packages](https://search.nixos.org/packages).
