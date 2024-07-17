#!/usr/bin/env bash

set -e

git clone --bare --recurse-submodules git@github.com:arg3nt/dotfiles.git $HOME/.cfg

function config {
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

config checkout

config submodule update --init --recursive

config config status.showUntrackedFiles no

vim -c ':PlugInstall' -c ':qa'

chsh -s $(which zsh)

