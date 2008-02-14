NAME=man-pages-zh_CN
DESTDIR=/usr/share
CONFDIR=/etc
TRANSLATED=DOCS/00TRANSLATED

MAN=1 1p 8 2 3 3p 4 5 6 7 9 0p tcl n l p o 3pm 3perl
MAN=1 8 2 3 4 5 6 7 9 n l

u8:
	mkdir UTF-8
	cp -r src/man* UTF-8/
gb:
	for i in $(MAN) ; do \
		mkdir -p GB/man$$i ; \
	done
	for f in `cat $(TRANSLATED)` ; do \
		iconv -f utf8 -t gb18030 src/$$f > GB/$$f ; \
	done
	cp src/man.macros GB/
html-gb:
	mkdir html-gb
	for i in $(MAN) ; do \
		mkdir -p html-gb/man$$i ; \
	done
	export LC_ALL=zh_CN.GB18030 ;\
	for f in `cat $(TRANSLATED)` ; do \
		iconv -f utf8 -t gb18030 src/$$f | utils/man2html > html-gb/$$f.html ; \
	done
clean:
	rm -rf UTF-8 GB BIG5 html-u8 html-gb html-b5 
	find . -name *~ -type f | xargs rm -f
	@rm -f *-stamp
	@cd src && find man* -type f -path *.[1-9nlpo] -o -name *.tcl \
	-o -name *.1[ml] -o -name *.3t -o -name *.3pm -o -name *.3perl \
	-o -name *.3thr -o -name *.[357]ssl -o -name *.8c \
	-o -name *.3gl -o -name *.[13457]x -o -name *.[013]p \
	|sort > TRANSLATED && cd .. && mv src/TRANSLATED $(TRANSLATED)
install-doc:
	rm -rf $(DESTDIR)/doc/$(NAME)
	mkdir -p $(DESTDIR)/doc
	cp -R DOCS $(DESTDIR)/doc/$(NAME)
	cp README* $(DESTDIR)/doc/$(NAME)
	cp COPYING $(DESTDIR)/doc/$(NAME)
install-u8:
	rm -rf $(DESTDIR)/man/zh_CN.UTF-8
	mkdir -p $(DESTDIR)/man
	cp -R UTF-8 $(DESTDIR)/man/zh_CN.UTF-8
install-gb:
	rm -rf $(DESTDIR)/man/zh_CN.GB* /usr/share/man/zh_CN.GB*
	mkdir -p $(DESTDIR)/man
	cp -R GB $(DESTDIR)/man/zh_CN.GB18030
	ln -s /usr/share/man/zh_CN.GB18030 $(DESTDIR)/man/zh_CN.GB2312
	ln -s /usr/share/man/zh_CN.GB18030 $(DESTDIR)/man/zh_CN.GBK
	ln -s /usr/share/man/zh_CN.GB18030 $(DESTDIR)/man/zh_CN
	mkdir -p $(CONFDIR)/profile.d
	cp -f src/cman/cman.conf $(CONFDIR)/
	cp -pf src/cman/cman.sh $(CONFDIR)/profile.d/
	cp -pf src/cman/cman.csh $(CONFDIR)/profile.d/
uninstall:
	rm -rf $(DESTDIR)/doc/$(NAME)
	rm -rf $(DESTDIR)/man/zh_CN* /usr/share/man/zh_CN*
	rm -f $(CONFDIR)/cman.conf $(CONFDIR)/profile.d/cman.*
