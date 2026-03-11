# NixOS Development Environment - Stockholm Region

Reproducible NixOS WSL configuration for developers.

## Prerequisites

- Windows with WSL2 installed
- NixOS-WSL installed ([instructions](https://github.com/nix-community/NixOS-WSL))

## Initial Setup

### Step 1: Create Your User

Edit `/etc/nixos/configuration.nix` and add your user:
```nix
{ config, lib, pkgs, ... }:
let
  stateVersion = "25.05";
  hsaid = "your-username";  # Change this
  full_name = "Your Full Name";  # Change this
in
{
  system.stateVersion = stateVersion;
  
  users.users.${hsaid} = {
    isNormalUser = true;
    home = "/home/${hsaid}";
    description = full_name;
    extraGroups = [ "wheel" ];
  };
  
  wsl.enable = true;
  wsl.defaultUser = hsaid;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  environment.systemPackages = with pkgs; [
    git
    vim
  ];
}
```

Rebuild and reboot:
```bash
sudo nixos-rebuild switch
```

After reboot, verify you're the new user:
```bash
whoami  # Should show your username/hsaid
```

### Step 2: Set Up SSH Keys for GitHub

Example:
```bash
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub
# Copy output and add to GitHub
```

Test connection:
```bash
ssh -T git@github.com
```

### Step 3: Request Admin to Add You

Contact the repo admin (Koutakis) to add your user to `flake.nix`. They need to:

1. Create `users/your-username/home.nix`
2. Add your config to `flake.nix`:
```nix
   wsl-your-username = mkUserConfig "your-username";
```

Once admin confirms, proceed to Step 4.

### Step 4: Clone and Apply Config
```bash
git clone git@github.com:Koutakis/NixOS-Region-Stockholm.git ~/nixos-config
sudo nixos-rebuild switch --flake ~/nixos-config#wsl-$(whoami)
```

## Day-to-Day Usage

### Making Changes to Your Config

You can ONLY modify: `users/<your-username>/home.nix`

DO NOT modify:
- `flake.nix` (admin only)
- `configuration.nix` (admin only)  
- `modules/` (admin only)
- Other users' directories

Edit your config:
```bash
nvim ~/nixos-config/users/$(whoami)/home.nix
```

Apply changes:
```bash
sudo nixos-rebuild switch --flake ~/nixos-config#wsl-$(whoami)
```

Recommended alias (add to your `home.nix`):
```nix
programs.zsh.shellAliases = {
  upgrade = "sudo nixos-rebuild switch --flake ~/nixos-config#wsl-$(whoami)";
  homec = "nvim ~/nixos-config/users/$(whoami)/home.nix";
};
```

### Commit Your Changes
```bash
cd ~/nixos-config
git add users/$(whoami)/
git commit -m "Description of changes"
git push
```

### Browse Other Configs for Inspiration

Check `users/` directory to see other developers' setups.

## Finding Packages

Search for packages: https://search.nixos.org/packages

## Troubleshooting

### Rebuild fails
Check error message, verify `home.nix` syntax.

### Permission denied on git push
Verify SSH key is added to GitHub.

### "error: path does not exist"
Contact admin - your user config might not be in `flake.nix` yet.
