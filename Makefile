FONTDIR=/usr/share/fonts/X11/misc

ifeq ($(INDEX),true)
RULE_INDEX=index
else
RULE_INDEX=noindex
endif

%.pcf.gz: %.bdf
	bdftopcf $^ | gzip > $@

fonts: tkw-font-7-n.pcf.gz

index:
	mkfontdir $(DESTDIR)/$(FONTDIR)/
	-xset fp rehash

noindex:

install-fonts: fonts
	mkdir -p $(DESTDIR)/$(FONTDIR)/
	install -m644 *.pcf.gz $(DESTDIR)/$(FONTDIR)/

install: install-fonts $(RULE_INDEX)

.PHONY: all fonts install install-fonts index noindex
