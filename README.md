check the [cheatsheet](cheatsheet.md)

## overview

- setup (5m)
- package management with `nix-env` (10m)
- isolated environments with `nix-shell` (10m)
- declarative operating system configuration with NixOS (5m)
  - service (5m)
  - network (5m)
  - user (5m)
- conclusion (5m)


## setup

- download and install virtualbox
- download nixos image
- create vm (settings?)
- check network


## package management with `nix-env`

- `sudo nix-channel --update`
- `nix-env -qa cmatrix`
- `nix-env -i cmatrix`
- `nix-env -e cmatrix`
- `nix-env --rollback`


## isolated environments with `nix-shell`

- `nix-shell -p python27Packages.somelib`
- `nix-shell -p python35Packages.somelib`


## declarative configuration management with NixOS

- edit `/etc/nixos/configuration.nix`

- `nixos-rebuild switch`


### service

- [sshd]()
- [httpd]()
- [monit]() (?)
- [rethinkdb]()


### network

- [hosntame]()
- [firewall]()


### user

- [staruser]()
- [staruser-sudo]()
- [staruser-sshkey]()


## conclusion

- declarative
- safe (atomic, rollback, isolated, consistent)
- reliable (deterministic, reproducible)
- fast (lazy)
