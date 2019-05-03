#!/bin/bash
set -e

_dir_of_sh_from_within=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
_prog=$(bash $_dir_of_sh_from_within/_find-clang-format.sh)

for x in $@; do
	# Replace "#pragma " by "//#pragma "
	sed -i 's/#pragma /\/\/#pragma /g' $x

	# Do format
	$_prog -i -style=file $x

	# Replace "// *#pragma " by "#pragma
	sed -i 's/\/\/ *#pragma /#pragma /g' $x
done
