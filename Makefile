OPENTYPE_DIR=/usr/share/fonts/opentype/tkw-font/
X11_DIR=/usr/share/fonts/X11/misc/

ifeq ($(INDEX),true)
RULE_INDEX=index
else
RULE_INDEX=noindex
endif

default: fonts

# Convert BDF to PCF.GZ
%.pcf: %.bdf
	@echo "Generating $@"
	bdftopcf $^  > $@

%.pcf.gz: %.pcf
	@echo "Generating $@"
	cat $^ | gzip > $@

# Convert PCF to OTB (OpenType Bitmap)
%.ttf: %.bdf
	@echo "Generating $@"
	fonttosfnt -v -b -c -g 2 -m 2 -o $@ $^


%.otb: %.bdf
	@echo "Generating $@"
	fontforge -lang=ff -c 'Open("$^");Import("$^"); Generate("$@");Close ();'

clean:
	rm -f *.ttf
	rm -f *.otb
	rm -f *.pcf.gz
	rm -f *.pcf

# Build all fonts formats
fonts: tkw-font-7-n.pcf.gz tkw-font-7-n.ttf tkw-font-7-n.otb

index:
	mkfontdir $(DESTDIR)/$(X11_DIR)/

rehash:
	xset fp rehash

noindex:

install-fonts: fonts
	mkdir -p $(DESTDIR)/$(OPENTYPE_DIR)/
	install -m644 *.ttf $(DESTDIR)/$(OPENTYPE_DIR)/
	install -m644 *.otb $(DESTDIR)/$(OPENTYPE_DIR)/
	mkdir -p $(DESTDIR)/$(X11_DIR)/
	install -m644 *.pcf.gz $(DESTDIR)/$(X11_DIR)/

install: install-fonts $(RULE_INDEX)

.PHONY: all fonts install install-fonts index noindex rehash clean default
