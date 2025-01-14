#!/usr/bin/env bash
set -euxo pipefail

CMD="docker run"
IMG="localhost/test"

docker build . -t $IMG

hyperfine -s "rm -rf data; mkdir data" -w 5 -n no-volume "$CMD $IMG" -n volume "$CMD -v ./data:/test/data $IMG"
