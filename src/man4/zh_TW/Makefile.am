include $(srcdir)/../manpages

mandir = @mandir@/zh_TW

man_MANS = $(MANPAGES)

if UTF8
%.4: $(srcdir)/../%.4
	iconv -f utf8 -t gbk $< | autob5 | $(top_srcdir)/utils/totw.pl | iconv -f big5 -t utf8 > $@
else
%.4: $(srcdir)/../%.4
	iconv -f utf8 -t gbk $< | autob5 | $(top_srcdir)/utils/totw.pl > $@
endif

clean-local:
	rm -f $(man_MANS)
