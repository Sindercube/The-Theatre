#!/bin/bash

VERSION="$1"

if [ -d "build/" ]; then
  rm -rf build/
fi
mkdir build

build () {

  if [ -d "temp/" ]; then
    rm -rf temp/
  fi
  mkdir temp

  rsync -q -av * temp/
  cp "$2.packwizignore" "temp/.packwizignore"
  cp -r "clothier/Clothier/" "temp/datapacks/Clothier"
  #rsync -q -av .packwizignore temp/
  #rsync -q -av "$2/" temp/

  cd temp/

    if [ -n "${VERSION}" ]; then
      sed -i 's/version = ".*"/version = "'"$VERSION"'"/g' pack.toml
    fi
    echo 'hash-format = "sha256"' > index.toml
    packwiz mr export --output "../build/$1.mrpack"

    cp "index.toml" "../index.toml"

  cd ..

  #rm -rf temp/

}

build "the-theatre-lite" "lite"
build "the-theatre" ""

#build "the-theatre-fabric" '\n[versions]\nfabric = "0.14.21"\nminecraft = "1.19.2"' "$VERSION"
#build "the-theatre-forge" '\n[versions]\nforge = "43.2.0"\nminecraft = "1.19.2"' "$VERSION"
