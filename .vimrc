set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
let g:NERDTreeDirArrows=0

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'othree/html5.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'

execute pathogen#infect()
filetype plugin indent on
NeoBundleCheck

syntax enable
set background=dark
colorscheme solarized
set autoindent
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nostartofline
set number
set ruler
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set softtabstop=2
set wildmenu

" Disable AutoComplPop.
let g:acp_enableAtStartup=0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup=1
" Use smartcase.
let g:neocomplcache_enable_smart_case=1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length=3

autocmd vimenter * if !argc() | NERDTree | endif

function! s:remove_dust()
  let cursor = getpos(".")
  " Remove trailing spaces
  %s/\s\+$//ge
  " Replace TAB => 2 spaces (if you want)
  "%s/\t/  /ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
let g:indent_guides_enable_on_vim_startup=1
