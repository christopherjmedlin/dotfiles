#!/bin/bash

# Thanks to crafter on askubuntu
# https://askubuntu.com/a/584346
find . -type f -name '*.m4a' -exec bash -c 'avconv -i "$0" "${0/%m4a/mp3}"' '{}' \;
find . -type f -name '*.m4a' -exec bash -c 'rm "$0"' '{}' \;
