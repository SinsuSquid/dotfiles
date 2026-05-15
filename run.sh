#!/bin/bash

# Starship Prompt
echo "🚀 Installing Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# .bashrc
echo "📝 Updating .bashrc..."
cat ./.bashrc >> ${HOME}/.bashrc

# .tmux.conf
echo "📟 Updating .tmux.conf..."
cat ./.tmux.conf >> ${HOME}/.tmux.conf

# vim-plug
echo "🖌️ Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# .vimrc
echo "🖌️ Updating .vimrc..."
cp ./.vimrc ${HOME}/.vimrc

# MAGI Theme Suite
echo "🧠 Installing MAGI-theme Suite..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SinsuSquid/MAGI-theme/main/install.sh)"

echo -e "\n✨ (๑˃ᴗ˂)ﻭ Dotfiles synchronization complete, Senpai!"
