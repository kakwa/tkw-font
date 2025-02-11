# tkw-font
Tiny kakwa font, a 7 pixels bitmap font.

![tkw-font Screenshot](https://raw.githubusercontent.com/kakwa/tkw-font/refs/heads/main/misc/screenshot.png)

## Makefile Documentation

The `Makefile` included in this repository provides various commands to manage the font files. Below is a brief description of each target:

- **default**: Alias for the `fonts` target.
- **fonts**: Builds all font files (`tkw-font-7-n.pcf.gz` and `tkw-font-7-n.ttf`).
- **clean**: Removes all generated font files (`*.ttf`, `*.pcf.gz`, and `*.pcf`).
- **install**: Installs the font files to the system directories and optionally creates font indexes.
- **install-fonts**: Installs the font files to the system directories (`/usr/share/fonts/opentype/tkw-font/` and `/usr/share/fonts/X11/misc/`).
- **index**: Creates font indexes in the X11 font directory.
- **noindex**: Placeholder target for installations without indexing.
- **rehash**: Rehashes the X11 font path.

To build the font files:
```sh
make fonts
```

To install the font files:

```sh
make install
```
