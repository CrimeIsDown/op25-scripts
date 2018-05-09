#!/bin/bash

if [ -z "$1" ]; then
    echo "ERROR: No argument supplied."
    echo "Usage: ./op25_trunked_rx.sh (Sysname from trunk.tsv)"
    echo "Example: ./op25_trunked_rx.sh STARCOM21"
    exit
fi

source .env

TRUNKCONFIG=`readlink -f $BASEPATH/trunk_starcom21.tsv`
CONTROLFREQ=`grep $1 $TRUNKCONFIG | cut -f2 | sed 's/"//g'`"e6"

cd $RXDIR
./rx.py  --args $OP25_ARGS --gains $OP25_GAIN -f $CONTROLFREQ -q $OP25_PPM -S $OP25_SAMPLERATE -D $OP25_DEMOD -2 -o 12.5e3 -T $TRUNKCONFIG -w -U -l http:127.0.0.1:8080 2> $ERRORLOG
cat $ERRORLOG
