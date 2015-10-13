BIN = cutl
PREFIX ?= /usr/local
DESTDIR ?=
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man
CP ?= cp
DIRS = $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1

all:

link: CP = ln -rs
link: install

$(DIRS):
	@mkdir -vp $@

install-bin: $(DESTDIR)$(BINDIR)
	@$(CP) -vf $(BIN) $<
	@chmod 755 $</$(BIN)

install-man: $(DESTDIR)$(MANDIR)/man1
	@$(CP) -vf $(BIN).1 $<
	@chmod 644 $</$(BIN).1

install: install-bin install-man

uninstall:
	@rm -vf "$(DESTDIR)$(BINDIR)/$(BIN)" \
		"$(DESTDIR)$(MANDIR)/man1/$(BIN).1"
