#!/usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p bash hyperfine
set -euxo pipefail

CMD="docker run"
IMG="localhost/test"

docker build . -t $IMG

hyperfine -s "rm -rf data; mkdir data" -w 5 -n no-volume "$CMD $IMG" -n volume "$CMD -v ./data:/test/data $IMG"
