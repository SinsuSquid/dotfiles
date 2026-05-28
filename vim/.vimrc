call plug#begin()

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-visual-multi'
Plug 'SinsuSquid/MAGI-theme'

call plug#end()

set number
set termguicolors
set mouse=a
colorscheme magi
set foldmethod=manual

let g:airline_theme='magi'
let g:airline_powerline_fonts = 1
