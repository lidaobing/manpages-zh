#!/usr/bin/env perl
#
# 将标题替换为中文和英文混合的标准标题
# 将签名添加在文档最后
#
while (<>){
	s/^\.SH "?SYNOPSIS"?/\.SH "总览 SYNOPSIS"/;
	s/^\.SH "?DESCRIPTION"?/\.SH "描述 DESCRIPTION"/;
	s/^\.SH "?SEE ALSO"?/\.SH "参见 SEE ALSO"/;
	s/^\.SH "?AUTHOR"?/\.SH "作者 AUTHOR"/;
	s/^\.SH "?KEYWORDS"?/\.SH "关键字 KEYWORDS"/;
	s/^\.SH "?OPTIONS"?/\.SH "选项 OPTIONS"/;
	s/^\.SH "?EXAMPLE"?/\.SH "范例 EXAMPLE"/;
	print
}
print <<EOF;

.SH "[中文版维护人]"
.B 姓名 <email>
.SH "[中文版最新更新]"
.BR yyyy.mm.dd
.SH "《中国linux论坛man手册翻译计划》:"
.BI http://cmpp.linuxforum.net 
EOF
