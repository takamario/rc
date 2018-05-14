if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

let g:NERDTreeDirArrows=0

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
"NeoBundle 'sickill/vim-monokai'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'cespare/vim-toml'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'fatih/vim-go'
NeoBundle 'groenewege/vim-less'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'itchyny/vim-parenmatch'
NeoBundle 'jacoborus/tender.vim'
NeoBundle 'juliosueiras/vim-terraform-completion'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'nikvdp/ejs-syntax'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'posva/vim-vue'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-erlang/vim-erlang-runtime'
NeoBundle 'vim-ruby/vim-ruby'

call neobundle#end()

execute pathogen#infect()
filetype plugin indent on
NeoBundleCheck

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
set background=dark
"colorscheme Monokai
colorscheme tender
set autoindent
"set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=
set nostartofline
set number
set ruler
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set softtabstop=2
set synmaxcol=300
set wildmenu

" Disable AutoComplPop.
let g:acp_enableAtStartup=0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup=1
" Use smartcase.
let g:neocomplcache_enable_smart_case=1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length=3

" rubocop
let g:syntastic_ruby_checkers = ['rubocop', 'reek']
let g:syntastic_slim_checkers = ['slim_lint']
" flake8
let g:syntastic_python_checkers = ['flake8']
" html
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "for']
let g:syntastic_scss_checkers = ['scss_lint']
" eslint
let g:syntastic_javascript_checkers = ['eslint']
" golint
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_fmt_command = "goimports"
" Terraform
let g:terraform_fmt_on_save = 1

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

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
