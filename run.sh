#!/bin/bash

# Oh my bash
echo "Installing oh-my-bash"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# .bashrc
echo "cat ./.bashrc >> ${HOME}/.bashrc" 
cat ./.bashrc >> ${HOME}/.bashrc
echo "source ${HOME}/.bashrc"
source ${HOME}/.bashrc

# .tmux.conf
echo "cat ./.tmux.conf >> ${HOME}/.tmux.conf" 
cat ./.tmux.conf >> ${HOME}/.tmux.conf

# vim-plug
echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# .vimrc
echo "cp ./.vimrc ${HOME}/.vimrc"
cp ./.vimrc ${HOME}/.vimrc

# Magi Theme
echo "Installing MAGI-theme"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SinsuSquid/MAGI-theme/main/install.sh)"

echo "Done! >:D"
