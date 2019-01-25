#!/bin/bash

if [ ! -z $(which clang-format-7.0) ]; then
  _prog=$(which clang-format-7.0)
elif [ ! -z $(which clang-format-6.0) ]; then
  _prog=$(which clang-format-6.0)
elif [ ! -z $(which clang-format) ]; then
  _prog=$(which clang-format)
else
  echo clang-format is not found!
  exit 1
fi

# clang-format version 6.0.0 (tags/RELEASE_600/final)
# -> 6.0.0
# -> 6
_version=$($_prog -version | awk '{print $3}')
_version="${_version%%.*}"
if [ $_version -lt 6 ]; then
  echo Must use clang-format version 6.0.0+
  exit 1
fi

echo $_prog
