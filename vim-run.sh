#!/bin/bash

# Check if absolute or relative path of the first argument.
# If absolute the "dirname" of the file location will be
# used for the mount point to the docker container
if [[ "$1" = /* ]]; then
    MOUNT=$(dirname "$1")
    WORKDIR=$MOUNT
elif [[ "$1" = ..* ]]; then
    MOUNT="$(readlink -f "$(dirname "$1")")"
    WORKDIR=$PWD
else
    MOUNT=$PWD
    WORKDIR=$MOUNT
fi

docker run -it --rm -v "$MOUNT:$MOUNT" -v "$WORKDIR:$WORKDIR" --workdir "$WORKDIR" "$USER-vim" "$USER" "$UID" "$(id -g "$USER")" "$@"
