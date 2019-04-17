if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let g:loaded_matchparen = 1

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Yggdroot/indentLine')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('cakebaker/scss-syntax.vim')
  call dein#add('cespare/vim-toml')
  call dein#add('digitaltoad/vim-pug')
  call dein#add('ekalinin/Dockerfile.vim')
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('fatih/vim-go')
  call dein#add('groenewege/vim-less')
  call dein#add('hashivim/vim-terraform')
  call dein#add('hynek/vim-python-pep8-indent')
  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/vim-parenmatch')
  call dein#add('jacoborus/tender.vim')
  call dein#add('juliosueiras/vim-terraform-completion')
  call dein#add('junegunn/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('kien/ctrlp.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('maksimr/vim-jsbeautify')
  call dein#add('mustache/vim-mustache-handlebars')
  call dein#add('nikvdp/ejs-syntax')
  call dein#add('nvie/vim-flake8')
  call dein#add('othree/html5.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('posva/vim-vue')
  call dein#add('prettier/vim-prettier')
  call dein#add('rking/ag.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('sickill/vim-monokai')
  call dein#add('slim-template/vim-slim')
  call dein#add('szw/vim-tags')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-git')
  call dein#add('tpope/vim-markdown')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-erlang/vim-erlang-runtime')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('w0rp/ale')
  call dein#add('zchee/deoplete-go', {'build': 'make'})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let g:NERDTreeDirArrows=0

filetype plugin indent on
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
set background=dark
"colorscheme Monokai
colorscheme tender
set ambiwidth=double
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

" ale
let g:ale_linters = {
  \ 'ruby': ['rubocop', 'reek'],
  \ 'slim': ['slim_lint'],
  \ 'scss': ['scss_lint'],
  \ 'javascript': ['eslint'],
  \ 'python': ['flake8'],
  \ 'go': ['golint', 'govet', 'errcheck'],
  \ 'php': ['phpcs']
  \}
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace']
  \}
let g:ale_fix_on_save = 1

" gofmt
let g:go_fmt_command = "goimports"
let g:indentLine_faster = 1
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

let g:deoplete#enable_at_startup = 1

let g:vim_tags_ctags_binary = '/usr/local/bin/ctags'

" Terraform
let g:terraform_fmt_on_save = 1

autocmd vimenter * if !argc() | NERDTree | endif

"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
autocmd FileType php setl ts=4 sw=4 sts=4 et
