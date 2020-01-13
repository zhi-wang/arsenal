#!/bin/bash
set -e


_config1="{                                        \
BasedOnStyle:                 LLVM                ,\
AlignOperands:                false               ,\
PointerAlignment:             Left                ,\
IndentPPDirectives:           AfterHash           ,\
ColumnLimit:                  80                  ,\
FixNamespaceComments:         false               }"


_dir_of_sh_from_within=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
_prog=$(bash $_dir_of_sh_from_within/_find-clang-format.sh)


if [ "$#" -gt 0 ]; then
  echo format source files
  for _x in "$@"; do
    echo "$_x"
    $_prog -style="$_config1" -i $_x
  done
fi
