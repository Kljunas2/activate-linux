# activate-linux for Wayland

The "Activate Windows" watermark ported to Linux with Gtk Layer Shell

# Linux

## Dependencies

This project depends on:

- `gtk-3.0` (on some distros also `libgtk-3-dev`)
- `gtk-layer-shell` and any [supported wayland compositor](https://github.com/wmww/gtk-layer-shell#supported-desktops)

## Building

```
make
```

## Installing

### Arch Linux

This project is in the AUR under [activate-linux-wayland-git](https://aur.archlinux.org/packages/activate-linux-wayland-git)

Install it using your favorite AUR helper.

### NixOS

#### NixOS installation with Flakes

Just import flake and use `defaultPackage`.

```nix
{
  ........
  inputs.activate-linux = {
    url = "github:Kljunas2/activate-linux";
    inputs.nixpkgs.follows = "nixpkgs"; # not mandatory but recommended
  };
  ........

  outputs = { self, nixpkgs, activate-linux }: {
      ........
      modules = [
        ({ self, ... }: {
          environment.systemPackages = with pkgs; [
            ........
            activate-linux.defaultPackage.xf86_64-linux
            ........
          ];
        })
      ];
    };
  };
}
```
