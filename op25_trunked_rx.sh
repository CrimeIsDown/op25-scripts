#!/bin/bash

if [ -z "$1" ]; then
    echo "ERROR: No argument supplied."
    echo "Usage: ./op25_trunked_rx.sh (Sysname from trunk.tsv)"
    echo "Example: ./op25_trunked_rx.sh STARCOM21"
    exit
fi

source .env

TRUNKCONFIG=`readlink -f $BASEPATH/trunk.tsv`
CONTROLFREQ=`grep $1 $TRUNKCONFIG | cut -f2 | sed 's/"//g'`

$TERMINAL -e "$BASEPATH/$AUDIO_SCRIPT"

cd $RXDIR
./rx.py  --args $OP25_ARGS --gains $OP25_GAIN -f "$CONTROLFREQ"e6 -q $OP25_PPM -S $OP25_SAMPLERATE -D $OP25_DEMOD -2 -o 12.5e3 -T $TRUNKCONFIG -w 2> $ERRORLOG
kill $(pgrep "$AUDIO_SCRIPT")
cat $ERRORLOG
