#!/bin/bash
docker run --rm -i -t -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged chrome70
