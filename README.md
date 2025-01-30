# IISER-Pune Login Daemon

This is a python script that logs into IISER Pune LAN automatically (in daemon mode) or when required.

## Installation

### Flakes

The recommended way to install is by adding this flake as an input to your system flake:

```nix
inputs = {
    ...

    iiserpune-login-daemon.url = "github:vigneshpai2003/iiserpune-login-daemon";
};
```

and then adding the package to `environment.systemPackages` or `home.packages` (Home Manager):

```nix
{ inputs, ... }:
{
    ...

    environment.systemPackages = with packages; [
        ...
        inputs.iiserpune-login-daemon.packages.x86_64-linux.default;
    ];

    ...
}
```

## Development

If direnv is installed, then running `direnv allow` in the base directory gives a development environment in which the python scripts can be run.

To compile the project, run `nix build .` in the base directory.