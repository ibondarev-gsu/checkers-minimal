#!/usr/bin/env bash

set -e

echo "Generating gogo proto code"


proto_dirs=$(find . -path -prune -o -name '*.proto' -print0 | xargs -0 -n1 dirname | sort | uniq)
echo $proto_dirs
for dir in $proto_dirs; do
  for file in $(find "${dir}" -maxdepth 1 -name '*.proto'); do
      buf generate --template buf.gen.gogo.yaml $file
  done
done
