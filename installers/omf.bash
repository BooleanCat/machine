#!/usr/bin/env bash
set -euo pipefail

curl -L --silent https://get.oh-my.fish > downloads/omf-install

set +e
output="$( fish ./downloads/omf-install --noninteractive 2>&1 )"
set -e

rm ./downloads/omf-install

if grep --quiet "Existing installation detected" <<< "$output"; then
  echo 'already installed'
  exit 0
fi

if ! grep --quiet "successfully installed" <<< "$output"; then
  echo 'failed to install oh-my-fish' 1>&2
  echo "$ouput" 1>&2
  exit 1
fi
