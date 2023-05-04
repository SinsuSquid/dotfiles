call plug#begin()

Plug 'matze/vim-move'
Plug 'preservim/nerdtree'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-syntastic/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-visual-multi'
Plug 'airblade/vim-gitgutter'

call plug#end()

set number
set mouse=a
colorscheme nord
set foldingmethod=manual

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
