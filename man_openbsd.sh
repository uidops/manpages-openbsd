#!/bin/sh

one_method() {
	manpage=$(fd $1 /opt/manpages-openbsd/man*/ | head -1)
	man $manpage
}

two_method() {
	manpage="/opt/manpages-openbsd/man$1/$2.$1openbsd.gz"
	man $manpage
}

if [ $# = 0 ];
then
	printf "$0: Invalid syntax.\n" > /dev/stderr
elif [ $# = 1 ];
then
	one_method $1
elif [ $# = 2 ];
then
	two_method $1 $2
else
	printf "$0: Invalid syntax.\n" > /dev/stderr
fi
