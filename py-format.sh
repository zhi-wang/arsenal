#!/bin/bash

if [ ! -z $(which autopep8) ]; then
  _prog=$(which autopep8)
else
  echo autopep8 not found!
  exit
fi

if [ "$#" -gt 0 ]; then
  echo format source files
  for _x in "$@"; do
    echo "$_x"
    $_prog -i $_x
  done
fi
