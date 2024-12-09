#!/bin/bash

# .bashrc
echo "cat ./.bashrc >> ${HOME}/.bashrc" 
cat ./.bashrc >> ${HOME}/.bashrc
echo "source ${HOME}/.bashrc"
source ${HOME}/.bashrc

# .vimrc
echo "cp ./.vimrc ${HOME}/.vimrc"
cp ./.vimrc ${HOME}/.vimrc

# .tmux.conf
echo "cp ./.tmux.conf ${HOME}/.tmux.conf"
cp ./.tmux.conf ${HOME}/.tmux.conf
echo "cp ./.tmux.nord ${HOME}/.tmux.nord"
cp ./.tmux.nord ${HOME}/.tmux.nord

echo "Done! >:D"
