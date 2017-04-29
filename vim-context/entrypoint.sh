#!/bin/bash

user=$1
uid=$2
gid=$3
shift 3

HOMEDIR="/homedir/$user"
mkdir -p "$HOMEDIR"
groupadd --gid "$gid" "$user"
useradd --home-dir "$HOMEDIR" --shell /bin/bash --uid "$uid" --gid "$gid" "$user"
chown -R "$user" "$HOMEDIR"

ln -s "/vim" "$HOMEDIR/.vim"
ln -s "/vim/.vimrc" "$HOMEDIR/.vimrc"

echo "$@"

su "$user" -c "vim $*"
