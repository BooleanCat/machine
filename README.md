# BooleanCat's Machine

This repo contains scripts and configuration for an opinionated Linux
development environment. Tooling here can be used to either converge the state
of an existing Ubuntu 18.10 machine or to create a virtual development
environment using vagrant. See installation instructions for these two options.

## Installation (virtualbox)

```
$ git clone https://github.com/BooleanCat/machine.git ~/workspace/machine
$ vagrant up
$ vagrant reload
```

In order to properly configure vim you will need to, on the machine, run
`~/workspace/.vim/update`.

## Installation (fresh ubuntu 18.10 machine)

```
$ sudo apt update
$ sudo apt install git
$ git clone https://github.com/BooleanCat/machine.git ~/workspace/machine
$ cd ~/workspace/machine
$ ./converge.sh
```

In order to properly configure vim you will need to run
`~/workspace/.vim/update`.

## Updating

The provisioning script can be rerun by invoking `machine-update` from the VM
or machine where this script was used. It might also be a good idea to pull the
latest `machine` changes from git before doing this.

## Notes

The development experience laid out here is focused around vim. Specifically
the luanvim config is used, along with tmux integration with vim-panes. The
usual tmux pane transition shortcuts will treat embedded vim panes like tmux
panes.

Compilers/interpreters for the following languages are available:

1. go
1. rust
1. haskell
1. lua
1. python
1. C

Additionally, the atom editor is available but only usable on the non-VM
installations of `machine`.
