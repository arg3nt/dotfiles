#!/bin/sh

set -e

git clone --bare --recurse-submodules https://github.com/arg3nt/dotfiles $HOME/.cfg

function config {
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

config checkout

config config status.showUntrackedFiles no

