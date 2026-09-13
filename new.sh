#!/bin/env bash

# copy template to target
if [ -d "$1" ]; then
	cp -R template/* $1

	# optional: change to the finished dir
	# will only work if this script is sourced like `. new.sh <etc>`
	cd "$1"
else
	echo "Error: '$1' must be a valid folder"
fi
