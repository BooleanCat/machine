#!/usr/bin/env bash
set -euo pipefail

if ! brew -v; then
  sh -c "$( curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh )"
fi

eval "$( SHELL=/bin/bash /home/linuxbrew/.linuxbrew/bin/brew shellenv )"

if ! ansible --version &>/dev/null; then
  brew install ansible
fi

ansible-playbook \
  -i 'localhost,' \
  --ask-become-pass \
  --con local \
  playbook.yml
