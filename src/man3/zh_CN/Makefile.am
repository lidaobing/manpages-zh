include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

%.3: $(srcdir)/../%.3
	iconv -f utf8 -t gbk -o $@ $<

clean-local:
	rm -f $(man_MANS)
