check the [cheatsheet](cheatsheet.md)

## outline

- setup (5m)
- `nix-env` package management (10m)
- `nix-shell` isolated environments (10m)
- NixOS declarative operating system configuration
  - introduction (5m)
  - service (5m)
  - network (5m)
  - user (5m)
- conclusion (5m)


## setup

- [download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [download NixOS VirtualBox appliance](https://nixos.org/nixos/download.html), double click, launch VM
- log in with `demo`/`demo`
- open a terminal, eg. on the bottom left corner of the screen, click the  Launcher button → Applications → System → Terminal


## package management with `nix-env`

| | | |
|---|---|---|
| update package list | `sudo nix-channel --update` ||
| search | `nix search hello` ||
| live search | [nixos.org/nixos/packages.html](https://nixos.org/nixos/packages.html) ||
| install | `nix-env -i hello` | run with `hello` |
| uninstall | `nix-env -e hello` | running `hello` fails |
| rollback | `nix-env --rollback` | `hello` is  back |


## isolated environments with `nix-shell`

- start a shell in an environment with some packages available:
  - `nix-shell -p toilet`
    - `toilet hello`
    - `Ctrl+D` to exit nix-shell
    - `toilet hello`
  - `nix-shell -p toilet --run 'toilet --gay hello'`
  - [python example](python.md)
- `nix-shell` on its own will load `default.nix` or `shell.nix` from the current directory, where you can define an environment for a project


## NixOS declarative operating system configuration

- edit `/etc/nixos/configuration.nix`
  - eg. add `services.openssh.enable = true;` before the last `}`
- `nixos-rebuild switch` to the new configuration
- see option's current value and documentation by running `nixos-option services.openssh.enable`
- search [nixos.org/nixos/options.html](https://nixos.org/nixos/options.html), click the result, click the link after "Declared in:"
- `nixos-rebuild switch --rollback` to previous configuration

let's try a few configuration options:


### service

- `services.openssh.enable = true;`
  - run `ssh demo@localhost` on the vm and log in with `demo` / `demo`
- [nginx](nixos/nginx.nix)
  - go to http://localhost/status on the vm
- [monit](nixos/monit.nix)
  - go to http://localhost:2812 on the vm, log in with `admin` / `monit`


### system

- `system.autoUpgrade.enable = true;`
  - don't forget to check the documentation [nixos.org/nixos/options.html#autoupgrade](https://nixos.org/nixos/options.html#autoupgrade)
- `environment.systemPackages = [ pkgs.vim pkgs.cmatrix ];`
  - all users can run `cmatrix`


### user

- [user.nix](nixos/user.nix) normal user
- [user-sudo.nix](nixos/user-sudo.nix) with sudo
- [user-sshkey.nix](nixos/user-sshkey.nix) with ssh public key authentication


### network

- `networking.hostName = "darkstar";`
- `networking.firewall.allowedTCPPorts = [ 22 80 8000 ];`


## conclusion

- declarative - say what you want, not how to get there
- safe (atomic, rollback, isolated, consistent)
- reliable (deterministic, reproducible)
- fast (lazy, perfect cache)
