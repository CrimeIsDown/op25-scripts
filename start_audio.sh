#!/bin/bash
echo "Starting OP25 audio receiver..."
sleep 3
nc -kluvw 1 127.0.0.1 23456 | aplay -c1 -f S16_LE -r 8000 2> /dev/null
