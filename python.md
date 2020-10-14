### Using `nix-shell` to start shells with Python packages

You can use `nix-shell` to quickly start shells with different versions of Python and Python packages availabl. `nix-shell` will make sure the referred packages are made available (built or downloaded) in the `/nix/store`, and start a shell with environment variables like `PYTHONPATH` set appropriately.  For example:

#### Python 2.7 and NumPy

```nix-shell -p python27Packages.numpy```

In the shell started by `nix-shell`, check the versions:
- run `python --version`
- run `python`
    - type `import numpy; numpy.__version__`
    - `Ctrl+D` to exit python
- `Ctrl+D` to exit `nix-shell`.

#### Python 3.8 and NumPy

```nix-shell -p python36Packages.numpy```

Check the versions as above.

