export PATH=${HOME}/.local/bin:${PATH}
alias rm="rm -i"

# Search history based on what is already typed!
bind '"\e[A": history-search-backward'
# Same for the down arrow so you can go back!
bind '"\e[B": history-search-forward'

# --- MAGI Theme Suite ---
if [ -f ~/.MAGI-theme/env/magi.env.sh ]; then
    source ~/.MAGI-theme/env/magi.env.sh
fi

eval "$(starship init bash)"

# --- Terminal Color Support (24-bit/Truecolor) ---
export COLORTERM=truecolor
