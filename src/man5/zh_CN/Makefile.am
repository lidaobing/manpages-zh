include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

%.5: $(srcdir)/../%.5
	iconv -f utf8 -t gbk -o $@ $<

clean-local:
	rm -f $(man_MANS)
