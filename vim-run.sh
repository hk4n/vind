#!/bin/bash

IMAGE=$(docker images | grep -q "$USER-vim"; echo $?)

[[ $IMAGE == 1 ]] && docker build -t "$USER-vim" -f Dockerfile.vim .

docker run -it --rm -v "$PWD:$PWD" --workdir "$PWD" "$USER-vim" "$USER" "$UID" "$(id -g "$USER")" "$@"
