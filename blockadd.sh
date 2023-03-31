#!/bin/bash

if [[ ! -f "$1" ]]
then
	echo "ERROR: missing file"
	exit
fi
NEWBLOCK="$1"

if [[ ! -f "$2" ]]
then
	echo "ERROR: missing blockchain"
	exit
fi
BLOCKFILE="$2"

# Metadata for new data block
SIZE=$(wc -c "$NEWBLOCK" | tr -s ' ' | cut -d' ' -f1)
WHEN=$(date -u)

# Single line header
printf "BLOC\t%04x\t%s$WHEN\n" $SIZE >> $BLOCKFILE

# data
cat "$NEWBLOCK" >> "$BLOCKFILE"

# checksum to date
SUM=$(cat "$BLOCKFILE" | md5sum | cut -d' ' -f1)
echo $SUM >> $BLOCKFILE
