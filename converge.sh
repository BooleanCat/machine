#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt --yes install ansible

ansible-playbook -i "localhost," --con local playbook.yml
