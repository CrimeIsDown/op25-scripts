#!/bin/bash

if [ -z "$1" ]; then
    echo "ERROR: No argument supplied."
    echo "Usage: ./op25_conventional_rx.sh (Frequency in MHz)"
    echo "Example: ./op25_conventional_rx.sh 477.5125"
    exit
fi

source .env

CONTROLFREQ="$1"

cd $RXDIR
./rx.py  --args $OP25_ARGS --gains $OP25_GAIN -f "$CONTROLFREQ"e6 -q $OP25_PPM -S $OP25_SAMPLERATE -D $OP25_DEMOD -o 12.5e3 -w -U -P constellation 2> $ERRORLOG
cat $ERRORLOG
