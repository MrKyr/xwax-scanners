# Detect operating system in Makefile.
# Author: He Tao
# Date: 2015-05-30

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	OSFLAG = /usr/include/taglib
	DLFLAG = taglib-scanner
endif
ifeq ($(UNAME_S),Darwin)
	OSFLAG = /usr/local/include/taglib
	DLFLAG = taglib-scanner
	DLFLAG += taglib-scanner.dSYM
endif

all:
	gcc -ggdb -Wall -Werror -pedantic -I$(OSFLAG) -ltag_c taglib-scanner.c -o taglib-scanner

clean:
	rm -r $(DLFLAG)
