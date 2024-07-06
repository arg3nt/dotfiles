#!/usr/bin/env bash

set -e

git clone --bare --recurse-submodules https://github.com/arg3nt/dotfiles $HOME/.cfg

function config {
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

config checkout

config submodule update --init --recursive

config config status.showUntrackedFiles no

chsh -s $(which zsh)

