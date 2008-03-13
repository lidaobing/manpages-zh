include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

if UTF8
%tcl: $(srcdir)/../%tcl
	cp $< $@
%tk: $(srcdir)/../%tk
	cp $< $@
else !UTF8
%tcl: $(srcdir)/../%tcl
	iconv -f utf8 -t gbk -o $@ $<

%tk: $(srcdir)/../%tk
	iconv -f utf8 -t gbk -o $@ $<
endif

clean-local:
	rm -f $(man_MANS)
