call plug#begin()

Plug 'preservim/nerdtree'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
" Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-visual-multi'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let g:dracula_colorterm = 0
set number
set mouse=a
colorscheme dracula
set foldmethod=manual
