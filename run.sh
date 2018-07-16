#!/bin/bash
set -e
. activate carnd-term1

if [ -z "$1" ]
  then
    jupyter lab --allow-root
elif [ "$1" == *".ipynb"* ]
  then
    jupyter lab "$1" --allow-root
else
    exec "$@"
fi
