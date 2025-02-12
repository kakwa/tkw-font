# tkw-font

Tiny kakwa font, a really small 7 pixels monospace bitmap font.

![tkw-font Screenshot](https://raw.githubusercontent.com/kakwa/tkw-font/refs/heads/main/misc/screenshot.png)

# Generate & Install

## Prerequisites

### macOS
```sh
brew install fontforge font-util
```

### Debian/Ubuntu
```sh
sudo apt install fontforge xfonts-utils
```

## Targets

### Build Targets
- `all-fonts` - Generate all formats `PCF.GZ`, `PCF`, and `OTB` formats.
- `pcf` - Generate `PCF`
- `pcf.gz` - Generate `PCF.GZ`
- `otb` - Generate OpenType Bitmap (`OTB`).

### Utility Targets
- `clean` - Removes generated font files.
- `index` - Creates an X11 font index in the font directory.
- `rehash` - Refreshes the X11 font cache.
- `noindex` - No-op target used in conditional rules.

## Installation

### System-wide Installation

As Root:
```sh
make install PREFIX=/usr
```
This installs fonts to `/usr/local/share/fonts/`.

### User Installation (Non-root)

As User:
```sh
make install INSTALL_USER=true
```
This installs fonts to `~/.fonts/`.

## Fontconfig

You can test the availability of the font with the following commands:

```sh
# Check presence in X11
xlsfonts | grep tkw
```

```sh
# Check Presence in Wayland/fontconfig
fc-list | grep tkw
```

If you encounter issues, install `misc/71-enable-tkw-font.conf` in the appropriate directory (`/etc/fonts/conf.d` on Debian).

And then, rescan the fonts `fc-cache -fvr`.

# Using

## XTerm

```sh
xterm -bg black -fg white -fn -tkw-tkw-r-normal--7-70-72-72-c-40-iso8859-1 -fb -tkw-tkw-r-normal--7-70-72-72-c-40-iso8859-1
```

## Foot
```sh
foot --font tkw:size=5
```
