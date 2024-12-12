syntax enable
set relativenumber
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

call plug#begin()
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'mattn/emmet-vim'
Plug 'rakr/vim-one'
call plug#end()

set laststatus=2
set noshowmode

colorscheme codedark

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" make esacape happen without timeout
set ttimeoutlen=50

" set leader key
let mapleader = " "

" keybinding for FZF
nnoremap <leader>. :Files<CR> 
nnoremap <leader>fh :Files ~<CR> 
" keybinding for term
nnoremap <leader>tt :term<CR>

" keybindings for window splits
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wc :close<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wj :wincmd j<CR>

" keybinds for buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" keybinding for vim fugitive
nnoremap <leader>gg :G<CR>

" keybind for nerdtree
nnoremap <leader>nt :NERDTree<CR>

" keybinding for exiting vim and writing to file
nnoremap <leader>q :wq<CR>
nnoremap <leader>fw :w<CR>
nnoremap <leader>nq :q!<CR>

