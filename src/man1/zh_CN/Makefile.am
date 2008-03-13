include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

if UTF8
%.1: $(srcdir)/../%.1
	cp $< $@
else !UTF8
%.1: $(srcdir)/../%.1
	iconv -f utf8 -t gbk -o $@ $<
endif !UTF8

clean-local:
	rm -f $(man_MANS)
