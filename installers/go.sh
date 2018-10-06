#!/usr/bin/env bash
set -euo pipefail

function rm_if_exists() {
  path="$1"
  if [ -f "$path" ]; then
    rm -rf "$path"
  fi
}

go_version="go1.11.1.linux-amd64"

rm_if_exists /usr/local/go
rm_if_exists "/tmp/${go_version}.tar.gz"

(
  cd "/tmp"
  curl -R -O "https://dl.google.com/go/${go_version}.tar.gz"
  sudo tar zxf "${go_version}.tar.gz" -C /usr/local
)

rm_if_exists "/tmp/${go_version}.tar.gz"
