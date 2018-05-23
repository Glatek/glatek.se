#!/bin/bash
docker build -t gulp:latest docker/gulp
docker run -it --rm \
    -v "$(pwd)/public:/src/public" \
    gulp
