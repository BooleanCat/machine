#!/usr/bin/env bash
set -euo pipefail

lua_version="lua-5.3.5"

function rm_if_exists() {
  path="$1"
  if [ -f "$path" ]; then
    rm -rf "$path"
  fi
}

rm_if_exists ~/.lua
rm_if_exists "/tmp/${lua_version}.tar.gz"
rm_if_exists "/tmp/${lua_version}"

(
  cd "/tmp"
  curl -R -O "http://www.lua.org/ftp/${lua_version}.tar.gz"
  tar zxf "${lua_version}.tar.gz"
  cd "$lua_version"
  make linux
  make install INSTALL_TOP=~/.lua
)

rm_if_exists "/tmp/${lua_version}.tar.gz"
rm_if_exists "/tmp/${lua_version}"
