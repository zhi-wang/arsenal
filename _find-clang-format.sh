#!/bin/bash


if [ ! -z $(which clang-format-10.0) ]; then
  _prog=$(which clang-format-10.0)
elif [ ! -z $(which clang-format) ]; then
  _prog=$(which clang-format)
else
  echo clang-format is not found!
  exit 1
fi


# clang-format version 6.0.0 (tags/RELEASE_600/final)
# -> 6.0.0 (tags/RELEASE_600/final)
# -> 6
_version=$($_prog --version)
_version="${_version##*clang-format version}"
_version="${_version%%.*}"
if [ $_version -lt 10 ]; then
  echo Must use clang-format version 10.0.0+
  exit 1
fi


echo $_prog
