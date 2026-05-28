#!/bin/bash

# Starship Prompt
echo "🚀 Installing Starship..."
mkdir -p "$HOME/.local/bin"
curl -sS https://starship.rs/install.sh | sh -s -- --yes --bin-dir "$HOME/.local/bin"

# vim-plug
echo "🖌️ Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# MAGI Theme Suite
echo "🧠 Installing MAGI-theme Suite..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SinsuSquid/MAGI-theme/main/install.sh)"

# Function to back up existing non-symlink files to prevent Stow conflicts
prepare_stow() {
    local target="$1"
    if [ -f "$target" ] && [ ! -L "$target" ]; then
        local backup="${target}.bak.$(date +%Y%m%d_%H%M%S)"
        echo "🗄️ Conflicting file found at $target! Backing up to $backup..."
        mv "$target" "$backup"
    fi
}

# Sync configurations
if command -v stow >/dev/null 2>&1; then
    echo "📦 GNU Stow detected! Let's symlink those configs, Senpai! (≧▽≦)✨"
    
    # Ensure there are no conflicting files before stowing
    prepare_stow "${HOME}/.bashrc"
    prepare_stow "${HOME}/.tmux.conf"
    prepare_stow "${HOME}/.vimrc"
    
    # Restow files (-R) to target (~/) and be verbose (-v)
    stow -v -R -t "${HOME}" bash tmux vim
else
    echo "⚠️ GNU Stow not detected! Falling back to the traditional copy/append workflow... 🛠️"
    
    # .bashrc
    echo "📝 Appending to .bashrc..."
    cat ./bash/.bashrc >> "${HOME}/.bashrc"

    # .tmux.conf
    echo "📟 Appending to .tmux.conf..."
    cat ./tmux/.tmux.conf >> "${HOME}/.tmux.conf"

    # .vimrc
    echo "🖌️ Copying .vimrc..."
    cp ./vim/.vimrc "${HOME}/.vimrc"
fi

echo -e "\n✨ (๑˃ᴗ˂)ﻭ Dotfiles synchronization complete, Senpai!"
