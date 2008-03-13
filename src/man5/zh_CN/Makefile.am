include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

if UTF8
%.5: $(srcdir)/../%.5
	cp $< $@
else !UTF8
%.5: $(srcdir)/../%.5
	iconv -f utf8 -t gbk -o $@ $<
endif

clean-local:
	rm -f $(man_MANS)
