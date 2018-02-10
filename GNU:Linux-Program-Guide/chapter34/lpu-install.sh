#!/bin/sh
# Listing 34.1
# lpu-install.sh - Demonstrate install usage

LPU=/tmp/lpu-install
SRC=./tar-1.13/src

for DIR in 10 20 30
do
    install -c -d -o $USER $LPU/$DIR
    install -c -m 111 -o $USER $SRC/*.c $LPU/$DIR
done

if [ $USER = root ]; then
    for GRP in $(cut -f1 -d: /etc/group)
    do
        install -c -d -o $USER -g $GRP $LPU/$GRP
        install -c -m 400 -o $USER -g $GRP $SRC/*.c $LPU/$GRP
    done
else
    echo "The second code block must be executed by root"
fi
