# TKW-Font

Tiny KakWa Font: a really small 7 pixels monospaced bitmap font.

![tkw-font Screenshot](https://raw.githubusercontent.com/kakwa/tkw-font/refs/heads/main/misc/screenshot.png)

# License

TKW-Font is licensed under the SIL Open Font License, Version 1.1.

The license is available with a FAQ at [scripts.sil.org](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).

# Generate font files & Installation

## Prerequisites

### MacOS

```sh
brew install fontforge font-util
```

### Debian/Ubuntu

```sh
sudo apt install fontforge xfonts-utils
```

## Targets

### Build Targets

- `all-fonts` - Generate all formats `PCF.GZ`, `PCF`, and `OTB` formats (default).
- `pcf` - Generate `PCF`
- `pcf.gz` - Generate `PCF.GZ`
- `otb` - Generate OpenType Bitmap (`OTB`).

### Utility Targets

- `clean` - Removes generated font files.

## Installation

### Installation Targets

- `index` - Creates an X11 font index in the font directory.
- `rehash` - Refreshes the X11 and fontconfig font cache.
- `install-fonts` - Install only the fonts
- `install-conf` - Install only the fc configuration

### User Installation (Non-root)

As User:
```sh
make install INSTALL_USER=true -j
```

This installs fonts to `~/.fonts/` and the config to `~/.fonts.conf.d/`.
It also refresh `fc-cache` and X11 font cache.

### System-wide Installation

As Root:
```sh
make install -j
```

This installs fonts to:
* `otb` - `/usr/share/fonts/opentype/tkw-font/`
* `pcf.gz` - `/usr/share/fonts/X11/misc/`

And the config to `/etc/fonts/conf.d/`.

To tweak this install, use the usual variables (`PREFIX`, `SYSCONFDIR`, `DESTDIR`) or manually copy the fonts in the appropriate directories of your system.

## Fontconfig & X11 indexation

You can test the availability of the font with the following commands:

X11:
```sh
# Check font path:
xset q

# Optionally add your ~/.fonts to X font path
xset +fp ~/.fonts/

# Check presence in X11
xlsfonts | grep tkw
```

Fontconfig:
```sh
# Check fontconfig font path:
fc-cache -v | grep -v '^/'

# Check Presence in Wayland/fontconfig
fc-list | grep tkw
```

# Trying tkw-font

Here is a quick way to try tkw-font:

```sh
# With Xterm
xterm -bg black -fg white -fn -tkw-tkw-r-normal--7-70-72-72-c-40-iso8859-1 -xrm "XTerm.vt100.allowBoldFonts: false"

# With foot
foot --font tkw:size=5
```
