include $(srcdir)/../manpages

mandir = @mandir@/zh_TW

man_MANS = $(MANPAGES)

if UTF8
%.6: $(srcdir)/../%.6
	iconv -f utf8 -t gbk $< | autob5 | $(top_srcdir)/utils/totw.pl | iconv -f big5 -t utf8 > $@
else
%.6: $(srcdir)/../%.6
	iconv -f utf8 -t gbk $< | autob5 | $(top_srcdir)/utils/totw.pl > $@
endif

clean-local:
	rm -f $(man_MANS)
