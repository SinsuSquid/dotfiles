#!/bin/bash

# Move to the directory where this script is located
cd "$(dirname "$0")"

# --- Colors & Aesthetics ---
ORANGE='\033[38;2;236;116;32m'
PURPLE='\033[38;2;150;95;212m'
RED='\033[38;2;237;35;35m'
GREEN='\033[38;2;139;212;80m'
CYAN='\033[38;2;60;255;208m'
NC='\033[0m' # No Color

# --- Dependency Check & Installation ---
echo -e "🛠️  ${GREEN}Verifying system dependencies...${NC}"

install_pkg() {
    if ! command -v $1 &> /dev/null; then
        echo -e "   - ${CYAN}$1${NC} not found. Installing..."
        if command -v apt-get &> /dev/null; then
            sudo apt-get update -y > /dev/null 2>&1
            sudo apt-get install -y $1 > /dev/null 2>&1
        elif command -v pacman &> /dev/null; then
            sudo pacman -S --noconfirm $1 > /dev/null 2>&1
        elif command -v dnf &> /dev/null; then
            sudo dnf install -y $1 > /dev/null 2>&1
        elif command -v brew &> /dev/null; then
            brew install $1 > /dev/null 2>&1
        else
            echo -e "   - ${RED}Error:${NC} No supported package manager found (apt/pacman/dnf/brew)."
        fi
    else
        echo -e "   - ${CYAN}$1${NC} is synchronized."
    fi
}

for pkg in vim tmux btop git curl alacritty stow; do install_pkg "$pkg"; done


# Function to back up existing files or remove existing symlinks to prevent Stow conflicts
prepare_stow() {
    local target="$1"
    if [ -L "$target" ]; then
        echo "🔗 Removing existing symlink at $target..."
        rm "$target"
    elif [ -f "$target" ]; then
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
    prepare_stow "${HOME}/.config/alacritty/alacritty.toml"
    
    # Restow files (-R) to target (~/) with --dotfiles and be verbose (-v)
    stow --dotfiles -v -R -t "${HOME}" bash tmux vim alacritty
else
    echo "⚠️ GNU Stow not detected! Falling back to the traditional copy/append workflow... 🛠️"
    
    # .bashrc
    echo "📝 Appending to .bashrc..."
    cat ./bash/dot-bashrc >> "${HOME}/.bashrc"

    # .tmux.conf
    echo "📟 Appending to .tmux.conf..."
    cat ./tmux/dot-tmux.conf >> "${HOME}/.tmux.conf"

    # .vimrc
    echo "🖌️ Copying .vimrc..."
    cp ./vim/dot-vimrc "${HOME}/.vimrc"

    # alacritty.toml
    echo "🎛️ Copying alacritty.toml..."
    mkdir -p "${HOME}/.config/alacritty"
    cp ./alacritty/dot-config/alacritty/alacritty.toml "${HOME}/.config/alacritty/alacritty.toml"
fi

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

echo -e "\n✨ (๑˃ᴗ˂)ﻭ Dotfiles synchronization complete, Senpai!"
