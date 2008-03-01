include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

%.7: $(srcdir)/../%.7
	iconv -f utf8 -t gbk -o $@ $<

clean-local:
	rm -f $(man_MANS)
