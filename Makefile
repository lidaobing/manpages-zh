NAME=manpages-zh
INSTDIR=$(DESTDIR)/usr/share
CONFDIR=$(DESTDIR)/etc
TRANSLATED=DOCS/00TRANSLATED

MAN=1 1p 8 2 3 3p 4 5 6 7 9 0p tcl n l p o 3pm 3perl
MAN=1 8 2 3 4 5 6 7 9 n l

all: $(TRANSLATED) gb-stamp b5-stamp

$(TRANSLATED):
	cd src && find man* -type f -path *.[1-9nlpo] -o -name *.tcl \
	-o -name *.1[ml] -o -name *.3t -o -name *.3pm -o -name *.3perl \
	-o -name *.3thr -o -name *.[357]ssl -o -name *.8c \
	-o -name *.3gl -o -name *.[13457]x -o -name *.[013]p \
	-o -name *.3tcl \
	|sort > TRANSLATED && cd .. && mv src/TRANSLATED $(TRANSLATED)

gb-stamp:
	mkdir -p zh_CN
	for f in `cat $(TRANSLATED)` ; do \
		OFNAME=`basename $$f | sed -e 's/\.\([^.]*\)$$/.zh_CN.\1/'` ; \
		iconv -f utf8 -t gbk src/$$f -o zh_CN/$$OFNAME ; \
	done
	touch $@

b5-stamp:
	mkdir -p zh_TW
	for f in `cat $(TRANSLATED)` ; do \
		OFNAME=`basename $$f | sed -e 's/\.\([^.]*\)$$/.zh_TW.\1/'` ; \
		iconv -f utf8 -t gb18030 src/$$f | autob5 -i gb -o big5 | utils/totw.pl > zh_TW/$$OFNAME ; \
	done
	touch $@

clean:
	rm -rf UTF-8 zh_CN zh_TW html-u8 html-gb html-b5 $(TRANSLATED)
	find . -name *~ -type f | xargs rm -f
	rm -f *-stamp

html-gb:
	mkdir html-gb
	for i in $(MAN) ; do \
		mkdir -p html-gb/man$$i ; \
	done
	export LC_ALL=zh_CN.GB18030 ;\
	for f in `cat $(TRANSLATED)` ; do \
		iconv -f utf8 -t gb18030 src/$$f | utils/man2html > html-gb/$$f.html ; \
	done
install-doc:
	rm -rf $(INSTDIR)/doc/$(NAME)
	mkdir -p $(INSTDIR)/doc
	cp -R DOCS $(INSTDIR)/doc/$(NAME)
	cp README* $(INSTDIR)/doc/$(NAME)
	cp COPYING $(INSTDIR)/doc/$(NAME)
install-u8:
	rm -rf $(INSTDIR)/man/zh_CN.UTF-8
	mkdir -p $(INSTDIR)/man
	cp -R UTF-8 $(INSTDIR)/man/zh_CN.UTF-8
install-gb:
	rm -rf $(INSTDIR)/man/zh_CN.GB* $(INSTDIR)/man/zh_CN
	mkdir -p $(INSTDIR)/man
	cp -R GB $(INSTDIR)/man/zh_CN
install-b5:
	rm -rf $(INSTDIR)/man/zh_TW
	mkdir -p $(INSTDIR)/man
	cp -R BIG5 $(INSTDIR)/man/zh_TW
uninstall:
	rm -rf $(INSTDIR)/doc/$(NAME)
	rm -rf $(INSTDIR)/man/zh_CN* /usr/share/man/zh_CN*
	rm -rf $(INSTDIR)/man/zh_TW* /usr/share/man/zh_TW*
	rm -f $(CONFDIR)/cman.conf $(CONFDIR)/profile.d/cman.*
