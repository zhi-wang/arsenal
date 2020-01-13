#!/bin/bash
set -e


_dir_of_sh_from_within=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
_prog=$(bash $_dir_of_sh_from_within/_find-clang-format.sh)


_os=$(uname -s)
if   [ $_os == Linux  ]; then
	_sed='sed -i'
elif [ $_os == Darwin ]; then
	_sed='perl -i -pe'
fi


for x in $@; do
	# Replace "#pragma " by "//#prag "
	$_sed 's/#pragma /\/\/#prag /g' $x


	# Do format
	$_prog -i -style=file $x


	# Replace "// *#prag " by "#pragma "
	$_sed -i -pe 's/\/\/ *#prag /#pragma /g' $x
done
