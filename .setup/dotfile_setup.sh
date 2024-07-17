#!/usr/bin/env bash

set -e

# The following has been tested on Ubuntu 24.04 Server
sudo apt install -y zsh fbterm

git clone --bare --recurse-submodules https://github.com/arg3nt/dotfiles.git $HOME/.cfg

function config {
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

config checkout

config submodule update --init --recursive

config config status.showUntrackedFiles no

vim -c ':PlugInstall' -c ':qa'

chsh -s $(which zsh) $(whoami)

# Setup fbterm

echo "#!/usr/bin/sh\nfbterm -- /usr/bin/sh -c \"TERM=fbterm login -p\"" | sudo tee /usr/sbin/fbterm-login

sudo sed -i 's/^ExecStart=-\/sbin\/agetty -o .*\$TERM$/ExecStart=-\/sbin\/agetty --noclear -n -l \/usr\/sbin\/fbterm-login %I \$TERM/g' \
    /usr/lib/systemd/system/getty@.service

