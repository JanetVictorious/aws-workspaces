#!/bin/bash

set -eu

xhost +

docker run -it --rm --name aws-workspaces \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$HOME/.aws-workspaces":"/root/.local/share/Amazon Web Services" \
    -e DISPLAY=$DISPLAY \
    aws-workspaces:1.0
