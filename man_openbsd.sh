#!/bin/sh

#* BSD 2-Clause License

#* Copyright (c) 2021, uidops
#* All rights reserved.

#* Redistribution and use in source and binary forms, with or without
#* modification, are permitted provided that the following conditions are met:
#* 1. Redistributions of source code must retain the above copyright notice, this
#*    list of conditions and the following disclaimer.
#* 2. Redistributions in binary form must reproduce the above copyright notice,
#*    this list of conditions and the following disclaimer in the documentation
#*    and/or other materials provided with the distribution.

#* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
#* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#manpages_path=/opt/manpages-openbsd

manpages_path=.
first_method() {
	manpage=$(find $manpages_path/man*/ -iname "$1*" | head -1)
	man $manpage
}

second_method() {
	manpage="$manpages_path/man$1/$2.$1"
	man $manpage
}

if [ $# = 0 ];
then
	printf " OpenBSD Manual pages\n\n Example:\n\t $0 style\n\t $0 9 style\n" > /dev/stderr
	exit 1

elif [ $# = 1 ];
then
	first_method $1
	exit 0

elif [ $# = 2 ];
then
	second_method $1 $2
	exit 0

else
	printf "$(basename "$0"): Invalid syntax.\n" > /dev/stderr
	exit 1

fi
