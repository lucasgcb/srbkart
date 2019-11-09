#!/bin/bash
./dl-svr.sh

if [ $# -eq 0 ]; then
  ./start-svr.sh
else
  ./start-svr.sh $1
fi

