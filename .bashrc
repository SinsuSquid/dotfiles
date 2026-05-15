export PATH=${HOME}/.local/bin:${PATH}
alias rm="rm -i"

# --- MAGI Theme Suite ---
if [ -f ~/.MAGI-theme/env/magi.env.sh ]; then
    source ~/.MAGI-theme/env/magi.env.sh
fi

eval "$(starship init bash)"

# --- Terminal Color Support (24-bit/Truecolor) ---
export COLORTERM=truecolor
