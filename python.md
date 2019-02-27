Start a shell with a versions of python and python packages available:
- `nix-shell -p python27Packages.numpy`
    - run `python --version`
    - run `python`
        - type `import numpy; numpy.__version__`
        - `Ctrl+D` to exit python
    - `Ctrl+D` to exit nix-shell
- `nix-shell -p python36Packages.numpy`
    - as above
