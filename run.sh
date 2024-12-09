#!/bin/bash

cat ./.bashrc >> ${HOME}/.bashrc
cp ./.vimrc ${HOME}/.vimrc
cp ./.tmux.conf ${HOME}/.tmux.conf
cp ./.tmux.nord ${HOME}/.tmux.nord

echo "Done! >:D"
