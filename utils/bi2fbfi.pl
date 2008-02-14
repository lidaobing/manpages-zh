#!/usr/bin/env perl
#
# 将html 格式中的<B></B>转换为roff 格式中的\fB \fR
# <I></I> 也转换为 \fI \fR
#
while(<>){
	s/\<b\>(.*?)\<\/b\>/\\fB\1\\fR/g;
	s/\<B\>(.*?)\<\/B\>/\\fB\1\\fR/g;
	s/\<i\>(.*?)\<\/i\>/\\fI\1\\fR/g;
	s/\<I\>(.*?)\<\/I\>/\\fI\1\\fR/g;
	print
	}
