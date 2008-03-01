include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

%tcl: $(srcdir)/../%tcl
	iconv -f utf8 -t gbk -o $@ $<

%tk: $(srcdir)/../%tk
	iconv -f utf8 -t gbk -o $@ $<

clean-local:
	rm -f $(man_MANS)
