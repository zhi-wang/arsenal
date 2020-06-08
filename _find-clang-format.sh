#!/bin/bash


if [ ! -z $(which clang-format-10) ]; then
  _prog=$(which clang-format-10)
elif [ ! -z $(which clang-format) ]; then
  _prog=$(which clang-format)
else
  echo clang-format is not found!
  exit 1
fi


# Ubuntu clang-format version 10.0.1-++20200529023659+a634a80615b-1~exp1~20200529004255.167
# -> Ubuntu clang-format version 10 -> 10
_version=$($_prog -version)
_version=$(echo "${_version%%.*}" | awk 'NF{ print $NF }')
if [ $_version -lt 10 ]; then
  echo Must use clang-format version 10+
  exit 1
fi


echo $_prog
