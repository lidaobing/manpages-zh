include $(srcdir)/../manpages

mandir = @mandir@/zh_TW

man_MANS = $(manpages)

if UTF8
%.8: $(srcdir)/../%.8
	iconv -f utf8 -t gbk $< | autob5 | $(top_srcdir)/utils/totw.pl | iconv -f big5 -t utf8 > $@
else
%.8: $(srcdir)/../%.8
	iconv -f utf8 -t gbk $< | autob5 | $(top_srcdir)/utils/totw.pl > $@
endif

clean-local:
	rm -f $(man_MANS)
