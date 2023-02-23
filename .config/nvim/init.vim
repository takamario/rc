if &compatible
  set nocompatible
endif

let s:dein_base = '/Users/takamario/.cache/dein'
let s:dein_src = '/Users/takamario/.cache/dein/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_src

call dein#begin(s:dein_base)
call dein#add(s:dein_src)
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
"call dein#add('Yggdroot/indentLine')
call dein#add('Quramy/tsuquyomi')
call dein#add('airblade/vim-gitgutter')
call dein#add('beanworks/vim-phpfmt')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('cakebaker/scss-syntax.vim')
call dein#add('cespare/vim-toml')
call dein#add('cocopon/iceberg.vim')
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
call dein#add('jparise/vim-graphql')
call dein#add('jremmen/vim-ripgrep')
call dein#add('juliosueiras/vim-terraform-completion')
call dein#add('junegunn/fzf', {'build': './install --all', 'merged': 0})
call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})
call dein#add('leafgarland/typescript-vim')
call dein#add('majutsushi/tagbar')
call dein#add('maksimr/vim-jsbeautify')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('nikvdp/ejs-syntax')
call dein#add('nvie/vim-flake8')
call dein#add('othree/html5.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('peitalin/vim-jsx-typescript')
call dein#add('plasticboy/vim-markdown')
call dein#add('posva/vim-vue')
call dein#add('prettier/vim-prettier')
call dein#add('scrooloose/nerdtree')
call dein#add('sickill/vim-monokai')
call dein#add('slim-template/vim-slim')
call dein#add('szw/vim-tags')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-git')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-erlang/vim-erlang-runtime')
call dein#add('vim-ruby/vim-ruby')
call dein#add('w0rp/ale')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#end()

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
"colorscheme tender
colorscheme iceberg
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
  \ 'eruby': ['erb'],
  \ 'slim': ['slimlint'],
  \ 'scss': ['stylelint'],
  \ 'javascript': ['eslint'],
  \ 'javascriptreact': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'typescriptreact': ['eslint'],
  \ 'python': ['flake8'],
  \ 'go': ['gofmt', 'govet', 'errcheck', 'staticcheck'],
  \ 'graphql': ['eslint'],
  \ 'php': ['phpcs'],
  \ 'yaml': ['yamllint'],
  \ 'json': ['jsonlint']
  \}
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'ruby': ['rubocop'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'javascriptreact': ['prettier', 'eslint'],
  \ 'json': ['prettier'],
  \ 'typescript': ['prettier', 'eslint'],
  \ 'typescriptreact': ['prettier', 'eslint'],
  \ 'css': ['prettier', 'stylelint'],
  \ 'scss': ['prettier', 'stylelint'],
  \ 'graphql': ['prettier', 'eslint'],
  \ 'python': ['black'],
  \ 'yaml': ['prettier']
  \}
let g:ale_fix_on_save = 1

" gofmt
let g:go_fmt_command = "goimports"
let g:indentLine_faster = 1
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

let g:deoplete#enable_at_startup = 1

let g:vim_tags_ctags_binary = '/usr/local/bin/ctags'

" fzf
nnoremap <C-p> :Files<CR>

" Terraform
let g:terraform_fmt_on_save = 1

autocmd vimenter * if !argc() | NERDTree | endif

"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
autocmd FileType php setl ts=4 sw=4 sts=4 et
let g:phpfmt_standard = 'PSR2'
let g:vim_markdown_folding_disabled = 1
