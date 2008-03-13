include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

if UTF8
%.7: $(srcdir)/../%.7
	cp $< $@
else !UTF8
%.7: $(srcdir)/../%.7
	iconv -f utf8 -t gbk -o $@ $<
endif

clean-local:
	rm -f $(man_MANS)
