#!/usr/bin/env bash
set -euo pipefail

luarocks_version="luarocks-3.0.2"

function rm_if_exists() {
  path="$1"
  if [ -f "$path" ]; then
    rm -rf "$path"
  fi
}

rm_if_exists ~/.luarocks
rm_if_exists "/tmp/${luarocks_version}.tar.gz"
rm_if_exists "/tmp/${luarocks_version}"

(
  cd "/tmp"
  curl -R -O "http://luarocks.github.io/luarocks/releases/${luarocks_version}.tar.gz"
  tar zxf "${luarocks_version}.tar.gz"
  cd "$luarocks_version"
  ./configure --prefix=${HOME}/.luarocks --with-lua=${HOME}/.lua
  make build
  make install
)

rm_if_exists "/tmp/${luarocks_version}.tar.gz"
rm_if_exists "/tmp/${luarocks_version}"
