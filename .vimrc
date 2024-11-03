syntax enable
set relativenumber
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

call plug#begin()
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'ap/vim-css-color'
call plug#end()

colorscheme catppuccin_mocha

