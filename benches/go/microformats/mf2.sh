#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

[[ ! -f $DIR/mf2 ]] && go build -o $DIR/mf2 $DIR/mf2.go

idx=$3
while [ $idx -gt 0 ]; do
	idx=$(( idx - 1 ))
	$DIR/mf2 $1 $2
done
