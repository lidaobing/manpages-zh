include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

%.6: $(srcdir)/../%.6
	iconv -f utf8 -t gbk -o $@ $<

clean-local:
	rm -f $(man_MANS)
