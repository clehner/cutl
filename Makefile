BIN = gcfcu
PREFIX ?= /usr/local
DESTDIR ?=
BINDIR ?= $(PREFIX)/bin
CP ?= cp

all:

link: CP = ln -rs
link: install

install-bin: $(DESTDIR)$(BINDIR)
	@mkdir -vp $(DESTDIR)$(BINDIR)
	@$(CP) -vf $(BIN) $<
	@chmod 755 $</$(BIN)

install: install-bin

uninstall:
	@rm -vf "$(DESTDIR)$(BINDIR)/$(BIN)"
