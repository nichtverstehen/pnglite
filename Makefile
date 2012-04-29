LIB_NAME       = libpnglite.a
CC             = gcc
INSTALL_PREFIX = /usr/local

.PHONY : all
all : $(LIB_NAME)

pnglite.o : pnglite.c pnglite.h
	$(CC) -c -opnglite.o pnglite.c -Wall

$(LIB_NAME) : pnglite.o
	ar -r $(LIB_NAME) pnglite.o

$(INSTALL_PREFIX)/lib/$(LIB_NAME) : $(LIB_NAME)
	install -D $< $@

$(INSTALL_PREFIX)/include/pnglite.h : pnglite.h
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
