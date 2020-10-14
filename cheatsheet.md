## **Nix** cheat sheet

### `nix-env` package management

| action | Ubuntu | Nix | notes |
|:---|:---|:---|:---|
| update package list | `sudo apt update` | `sudo nix-channel --update` | |
| search | `apt search <query>` | `nix search <query>` | use [nixos.org/nixos/packages.html](https://nixos.org/nixos/packages.html)  |
| install | `sudo apt install <package>` | `nix-env -i <package>` | no root, atomic, per user |
| upgrade installed | `sudo apt upgrade` | `nix-env -u` | no root, atomic, per user |
| remove | `sudo apt remove <package>` | `nix-env -e <package>` | no root, atomic, per user |
| undo last operation | ... | `nix-env --rollback` | no root, atomic, per user |
| list installed | `dpkg -l`| `nix-env -q` | per user |
| show generations | ... | `nix-env --list-generations` ||


### `nix-shell` isolated build/dev/run environments

| command | result |
|:---|:---|
| `nix-shell -p <packages>` | start shell in env with `<packages>` |
| `nix-shell` | start shell in the env defined by `shell.nix` or `default.nix` in current dir |
| `nix-shell --pure` | same, but outside env is inaccessible |


### NixOS configuration management

| command | result | notes |
|:---|:---|:---|
| edit `/etc/nixos/configuration.nix` | define new system configuration | running system is unaffected |
| `nixos-rebuild switch` | switch to the configuration defined in `/etc/nixos/configuration.nix` | atomic* |
| `nixos-rebuild switch --rollback` | switch to previous configuration | atomic*
| `nixos-option <option>` | show option value and documentation | also try [nixos.org/nixos/options.html](https://nixos.org/nixos/options.html) |

*services can fail to start
