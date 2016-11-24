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
- [download NixOS VirtualBox appliance](https://nixos.org/nixos/download.html)
- create vm TODO: settings
- check network


## package management with `nix-env`

| | |
|---|---|
| update package list | `sudo nix-channel --update` |
| search | `nix-env -qa cmatrix` |
| live search | [nixos.org/nixos/packages.html](https://nixos.org/nixos/packages.html) |
| install | `nix-env -i cmatrix` |
| uninstall | `nix-env -e cmatrix` |
| rollback | `nix-env --rollback` |


## isolated environments with `nix-shell`

- start a shell in an env with some packages available - `nix-shell -p hello`

try:

- `nix-shell -p python27Packages.somelib` TODO
- `nix-shell -p python35Packages.somelib` TODO


## declarative configuration management with NixOS

- edit `/etc/nixos/configuration.nix`
  - eg. add `networking.hostName = "star-darab";` before `}`
- `nixos-rebuild switch` to the new configuration
- inspect `nixos-option networking.hostName`
- search [nixos.org/nixos/options.html](https://nixos.org/nixos/options.html)
- `nixos-rebuild switch --rollback` to previous configuration

### service

- [sshd](nixos/sshd.nix)
- [nginx](nixos/nginx.nix)


### network

- [hosntame](nixos/hostname.nix)
- [firewall](nixos/firewall.nix)


### user

- [staruser](nixos/staruser.nix) normal user
- [staruser-sudo](nixos/staruser-sudo.nix) with sudo
- [staruser-sshkey](nixos/staruser-sshkey.nix) with ssh publik key authentication


## conclusion

- declarative
- safe (atomic, rollback, isolated, consistent)
- reliable (deterministic, reproducible)
- fast (lazy)
