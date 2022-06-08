set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set number
set inccommand=split
set mouse=a
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2


filetype plugin indent on
syntax on
set t_Co=256

" Plugins
call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sheerun/vim-polyglot'
  Plug 'ap/vim-css-color'
call plug#end()
