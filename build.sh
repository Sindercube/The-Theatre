#!/bin/bash

VERSION="$1"

if [ -d "build/" ]; then
  rm -rf build/
fi
mkdir build

if [ -d "temp/" ]; then
  rm -rf temp/
fi
mkdir temp

rsync -q -av modpack/* temp/

cd temp/

if [ -n "${VERSION}" ]; then
  sed -i 's/version = ".*"/version = "'"$VERSION"'"/g' pack.toml
fi
echo 'hash-format = "sha256"' > index.toml
packwiz mr export --output "../build/the-theatre.mrpack"

cd ..

rm -rf temp/

