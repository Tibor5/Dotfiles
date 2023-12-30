# shellcheck shell=bash

# /etc/profile.d/bashdotdir.sh
# Set Bash config location and source it.

[[ -d /home/tibor/.config/bash ]] && export BASHDOTDIR="/home/tibor/.config/bash"
[[ -r $BASHDOTDIR/bashrc ]] && . "$BASHDOTDIR/bashrc"
