## Nix Package Management

| action | Ubuntu | Nix | difference |
|:---|:---|:---|:---|
| update package list | `sudo apt update` | `sudo nix-channel --update` | |
| install | `sudo apt install <package>` | `nix-env -i <package>` | no root, atomic, local env |
| upgrade installed | `sudo apt upgrade` | `nix-env -u` | no root, atomic, local env |
| remove | `sudo apt remove <package>` | `nix-env -e` | no root, atomic, local env |
| undo last operation | ... | `nix-env --rollback` | no root, atomic, local env |
| list installed | `dpkg -l`| `nix-env -q` | local env |
| search | `apt search <query>` | `nix search <query>` | use [nixos.org/nixos/packages.html](https://nixos.org/nixos/packages.html)  |


## Nix Isolated Environments

| command | action |
|:---|:---|
| `nix-shell -p <packages>` | start shell in env with `<packages>` |
| `nix-shell` | start shell in the env defined by `shell.nix` or `default.nix` in current dir |
| `nix-shell --pure` | same, but outside env is inaccessible |


## NixOS Configuration Management

| command | action | notes |
|:---|:---|:---|
| edit `/etc/nixos/configuration.nix` | define new system configuration | |
| `nixos-rebuild switch` | switch to the configuration defined in `/etc/nixos/configuration.nix` | atomic* |
| `nixos-rebuild switch --rollback` | switch to previous configuration | atomic*
| `nixos-option <option>` | show option's current value and documentation | |
| search options | [nixos.org/nixos/options.html](https://nixos.org/nixos/options.html) | |

*services can fail to start
