include $(srcdir)/../manpages

mandir = @mandir@/zh_CN

man_MANS = $(MANPAGES)

if UTF8
%.3: $(srcdir)/../%.3
	cp $< $@
else !UTF8
%.3: $(srcdir)/../%.3
	iconv -f utf8 -t gbk -o $@ $<
endif

clean-local:
	rm -f $(man_MANS)
