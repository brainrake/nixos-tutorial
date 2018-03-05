## Nix Package Management

| action | Ubuntu | Nix | difference |
|:---|:---|:---|:---|
| update package list | `sudo apt-get update` | `sudo nix-channel --update` | |
| install | `sudo apt-get install <package>` | `nix-env -i <package>` | no sudo, atomic, local env |
| upgrade installed | `sudo apt-get upgrade` | `nix-env -u` | no sudo, atomic, local env |
| remove | `sudo apt-get remove` | `nix-env -e` | no sudo, atomic, local env |
| undo last operation | ... | `nix-env --rollback` | no sudo, atomic, local env |
| list installed | `dpkg -l`| `nix-env -q` | local env |
| search | `apt-cache search <query>` | `nix-env -qa <query>` | use [nixos.org/nixos/packages.html](https://nixos.org/nixos/packages.html)  |


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
