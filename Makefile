FONTDIR=/usr/share/fonts/opentype/tkw-font/

ifeq ($(INDEX),true)
RULE_INDEX=index
else
RULE_INDEX=noindex
endif

# Convert BDF to PCF.GZ
%.pcf.gz: %.bdf
	@echo "Generating $@"
	bdftopcf $^ | gzip > $@

# Convert PCF to OTB (OpenType Bitmap)
%.otb: %.bdf
	@echo "Generating $@"
	fonttosfnt -o $@ $^

# Build all fonts
fonts: tkw-font-7-n.pcf.gz tkw-font-7-n.otb

index:
	mkfontdir $(DESTDIR)/$(FONTDIR)/
	-xset fp rehash

noindex:

install-fonts: fonts
	mkdir -p $(DESTDIR)/$(FONTDIR)/
	install -m644 *.pcf.gz *.otb $(DESTDIR)/$(FONTDIR)/

install: install-fonts $(RULE_INDEX)

.PHONY: all fonts install install-fonts index noindex
