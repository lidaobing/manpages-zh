#! /bin/sh

#	$Id: man2html.sh,v 1.1 2003/11/24 05:10:00 bbbush Exp $
# 		www.linuxforum.net CMPP
# simple shell to process all the man pages, change them to html file
# Copyright (c) He Weiping(Laser Henry) (laser@zhengmai.com.cn)2000
#  You may freely re-write and/or re-distrabute this scrip
# all rights revoked
# 
# Laser	2000/10/11	0.0.1 	firstdraft
# Laser 2000/10/31	0.0.2	change those command to bin dir
# Laser 2000/10/31	0.0.3	fix the file types error
# 

#TOPDIR=$(cat /tmp/CMANROOT ) 
TOPDIR=$(echo $CMANROOT )
HTMLSUBDIR=html
HTMLFILE=
CMDPATH=$TOPDIR/bin

usage() {
	echo "Usage: man2html {the_directory_you_containing_the_man_file}"
}

prepare() {
        echo "you need to prepare the cman's root"
        echo "use command:"
#        echo "$ pwd >/tmp/CMANROOT"
	echo "$ CMANROOT=\`pwd\`>>~/.bash_profile"
        echo "in your cman's dir"
}


if [ "$#" = "0" ]; then
		usage
		exit 1
fi

if [ "$TOPDIR" = "" ]; then
        prepare
        exit 1
fi


for i in $* 
	do
		if [ -d $i ]; then
			if [ "$i" != "$HTMLSUBDIR" ]; then
				cd $i
				echo "we are now in $i"
				$CMDPATH/man2html.sh *
				cd ..
			fi
		elif [ "$i" != "man2html.sh"  ]; then

                        FILETYPE=$(file $i |cut -f2 -d ' ')

                        if [ "$FILETYPE" = "troff" ]; then

				echo "processing $i"
				HTMLFILE=$(echo $i |cut -d. -f 1)
				echo "generating $HTMLFILE.html"
				man2html $i > $HTMLFILE.html
				cat $HTMLFILE.html | $CMDPATH/htmlcharfix.pl > $TOPDIR/html/$HTMLFILE.html
				rm $HTMLFILE.html
			fi
		fi
	done

exit 0
