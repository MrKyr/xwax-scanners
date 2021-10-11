# Detect operating system in Makefile.
# Author: He Tao
# Date: 2015-05-30

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	OSFLAG = /usr/include/taglib
	DLFLAG = music-scan
endif
ifeq ($(UNAME_S),Darwin)
	OSFLAG = /usr/local/include/taglib
	DLFLAG = music-scan
	DLFLAG += music-scan.dSYM
endif

all:
	gcc -ggdb -Wall -Werror -pedantic -I$(OSFLAG) -ltag_c taglib-scanner.c -o music-scan

clean:
	rm -r $(DLFLAG)

install:
	install -d $(DESTDIR)/usr/local/bin/
	install -m 755 music-scan $(DESTDIR)/usr/local/bin/

uninstall:
	rm /usr/local/bin/music-scan
