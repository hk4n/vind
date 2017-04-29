#!/bin/bash

# Check if absolute or relative path of the first argument.
# If absolute the "dirname" of the file location will be
# used for the mount point to the docker container
if [[ "$1" = /* ]]; then
    MOUNT=$(dirname "$1")
else
    MOUNT=$PWD
fi

docker run -it --rm -v "$MOUNT:$MOUNT" --workdir "$MOUNT" "$USER-vim" "$USER" "$UID" "$(id -g "$USER")" "$@"
