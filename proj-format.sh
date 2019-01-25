#!/bin/bash
set -e

_dir_of_sh_from_within=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
_prog=$(bash $_dir_of_sh_from_within/_find-clang-format.sh)

$_prog -i -style=file $@
