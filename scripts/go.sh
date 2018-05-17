#!/usr/bin/env bash
set -euo pipefail

goversion="1.10.2.linux-amd64"

workdir="$( mktemp -d )"
trap "rm -r ${workdir}" EXIT

curl -L "https://dl.google.com/go/go${goversion}.tar.gz" > "${workdir}/go${goversion}.tar.gz"

if [ -f /usr/local/go ]; then
  rm -r /usr/local/go
fi

sudo tar -C /usr/local -xzf "${workdir}/go${goversion}.tar.gz"
