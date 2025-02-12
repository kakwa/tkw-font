PREFIX ?= /usr/local
OPENTYPE_DIR = $(PREFIX)/share/fonts/opentype/tkw-font/
X11_DIR = $(PREFIX)/share/fonts/X11/misc/
USER_FONT_DIR = $(HOME)/.fonts

ifeq ($(INDEX),true)
RULE_INDEX = index
else
RULE_INDEX = noindex
endif

default: all-fonts

# Convert BDF to PCF
%.pcf: %.bdf
	@echo "Generating $@"
	bdftopcf $^ > $@

%.pcf.gz: %.pcf
	@echo "Generating $@"
	cat $^ | gzip > $@

# Convert PCF to OTB (OpenType Bitmap)
%.otb: %.bdf
	@echo "Generating $@"
	fontforge -lang=ff -c 'Open("$^"); Import("$^"); Generate("$@"); Close ();'

otb: tkw-font-7-n.otb

pcf.gz: tkw-font-7-n.pcf.gz

pcf: tkw-font-7-n.pcf

clean:
	rm -f *.otb *.pcf.gz *.pcf

# Build all font formats
all-fonts: otb pcf pcf.gz

index:
ifeq ($(INSTALL_USER),true)
	mkfontdir $(USER_FONT_DIR)
else
	mkfontdir $(DESTDIR)/$(X11_DIR)/
endif

rehash:
	xset fp rehash
	fc-cache -fvr

noindex:

install-fonts: all-fonts
ifeq ($(INSTALL_USER),true)
	mkdir -p $(USER_FONT_DIR)
	install -m644 *.otb $(USER_FONT_DIR)/
	install -m644 *.pcf.gz $(USER_FONT_DIR)/
else
	mkdir -p $(DESTDIR)/$(OPENTYPE_DIR)/
	install -m644 *.otb $(DESTDIR)/$(OPENTYPE_DIR)/
	mkdir -p $(DESTDIR)/$(X11_DIR)/
	install -m644 *.pcf.gz $(DESTDIR)/$(X11_DIR)/
endif

install: install-fonts $(RULE_INDEX)

.PHONY: all all-fonts install install-fonts index noindex rehash clean default otb pcf pcf.gz
