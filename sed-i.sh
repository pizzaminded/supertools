#!/bin/bash
# 
# Platform-independent sed -i 
#
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' -e $1 $2
else
  sed -i -e $1 $2
fi
