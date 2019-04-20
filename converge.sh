#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt --yes install python ansible

ansible-playbook -i "localhost," --con local playbook.yml
