check the [cheatsheet](cheatsheet.md)

## outline

- setup (5m)
- package management with `nix-env` (10m)
- isolated environments with `nix-shell` (10m)
- declarative operating system configuration with NixOS
  - introduction (5m)
  - service (5m)
  - network (5m)
  - user (5m)
- conclusion (5m)


## setup

- [download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [download NixOS VirtualBox appliance](https://nixos.org/nixos/download.html), double click, launch VM
- login with `demo`/`demo` and run these commands:

```
sudo nix-channel --add https://nixos.org/channels/nixos-unstable
sudo nix-channel --update
sudo nixos-rebuild switch
```


## package management with `nix-env`

| | |
|---|---|
| update package list | `sudo nix-channel --update` |
| search | `nix search vim` |
| live search | [nixos.org/nixos/packages.html](https://nixos.org/nixos/packages.html) |
| install | `nix-env -i vim` |
| uninstall | `nix-env -e vim` |
| rollback | `nix-env --rollback` |


## isolated environments with `nix-shell`

- start a shell in an env with some packages available
  - `nix-shell -p python27Packages.numpy`
  - `nix-shell -p python35Packages.numpy`
  - `nix-shell -p hello --run 'hello -t'`
- `nix-shell` on its own will load `default.nix` or `shell.nix` from the current directory


## declarative configuration management with NixOS

- edit `/etc/nixos/configuration.nix`
  - eg. add `programs.bash.enableCompletion = true;` before the last `}`
- `nixos-rebuild switch` to the new configuration
- see option's current value and documentation by running `nixos-option programs.bash.enableCompletion`
- search [nixos.org/nixos/options.html](https://nixos.org/nixos/options.html)
- `nixos-rebuild switch --rollback` to previous configuration

let's try a few configuration options:


### service

- `services.sshd.enable = true;`
- [nginx](nixos/nginx.nix)


### system

- `system.autoUpgrade.enable = true;`
- `environment.systemPackages = [ pkgs.vim pkgs.cmatrix ];`


### user

- [staruser](nixos/staruser.nix) normal user
- [staruser-sudo](nixos/staruser-sudo.nix) with sudo
- [staruser-sshkey](nixos/staruser-sshkey.nix) with ssh public key authentication


### network

- `networking.hostName = "star-darab";`
- `networking.firewall.allowedTCPPorts = [ 22 80 8000 ];`


## conclusion

- declarative - say what you want, not how to get there
- safe (atomic, rollback, isolated, consistent)
- reliable (deterministic, reproducible)
- fast (lazy, perfect cache)
