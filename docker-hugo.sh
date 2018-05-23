#!/bin/bash
docker run -it --rm \
    -v "$(pwd):/src" \
    -v "$(pwd)/public:/src/public" \
    -w "/src" \
    cibuilds/hugo \
    hugo
