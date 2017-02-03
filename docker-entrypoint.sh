#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "docker run -v $PWD:/src:ro craigbarrau/relish <RELISH_API_TOKEN> <PROJECT_NAME>"
    exit 1
fi

echo "============================================"
echo "Pushing to relishapp.com with"
echo "  API Key:     <OMITTED>"
echo "  Projct Name: $2"
echo "============================================"

cat <<. >~/.relish
---
api_token: $1
.

relish push $2
