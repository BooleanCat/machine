#!/usr/bin/env bash

if echo omf | fish; then
  echo 'bcm-already-installed'
  exit
fi

curl -L https://get.oh-my.fish > omf-install

fish ./omf-install --noninteractive

rm ./omf-install
