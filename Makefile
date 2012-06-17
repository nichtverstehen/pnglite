LIB_NAME       = libpnglite.a
CC             = gcc
INSTALL_PREFIX = /usr/local

.PHONY : all
all : $(LIB_NAME)

pnglite.o : pnglite.c pnglite.h
	$(CC) -fpic -c -opnglite.o pnglite.c -Wall

lib%.a : %.o
	ar -r $@ $<

$(INSTALL_PREFIX)/lib/% : %
	install -D $< $@

$(INSTALL_PREFIX)/include/%.h : %.h
	install -D $< $@

.PHONY : install
install : $(INSTALL_PREFIX)/lib/$(LIB_NAME) $(INSTALL_PREFIX)/include/pnglite.h

.PHONY : uninstall
uninstall :
	rm -f $(INSTALL_PREFIX)/lib/$(LIB_NAME)
	rm -f $(INSTALL_PREFIX)/include/pnglite.h

.PHONY : clean
clean : 
	rm -f $(LIB_NAME)
	rm -f pnglite.o
