#!/bin/bash

# Get the current date
DATE=$(date +"%Y-%m-%d")

# Get the title from the second argument or file name without extension
if [ $# -eq 2 ]; then
  TITLE="$2"
else
  FILENAME=$(basename -- "$1")
  TITLE="${FILENAME%.*}"
fi

# Create the header string
HEADER="+++\ntitle = \"$TITLE\"\ndate = $DATE\n+++\n\n"

# Prepend the header to the file
echo -e "$HEADER$(cat "$1")" > "$1"