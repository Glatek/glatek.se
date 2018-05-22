#!/bin/bash
docker run -it --rm \
    -v "$(pwd):/src" \
    -v "$(pwd)/public:/src/public" \
    cibuilds/hugo
    hugo --i18n-warnings
