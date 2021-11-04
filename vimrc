call plug#begin('~/.vim/plugged')

"Make sure you use single quotes
"
" On-demand loading
"
Plug 'dag/vim-fish'
Plug 'elzr/vim-json'
Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jxnblk/vim-mdx-js'
Plug 'w0rp/ale'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'dyng/ctrlsf.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'elmcast/elm-vim'
Plug 'cakebaker/scss-syntax.vim'
" Plug 'ternjs/tern_for_vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
" Plug 'flowtype/vim-flow'
" Plug 'llimllib/js-prettier'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'evanleck/vim-svelte'
"
"
" Add plugins to &runtimepath
call plug#end()

syntax on
colorscheme onedark
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start
set hidden
set nocompatible
set ignorecase
set smartcase
set background=dark
set scrolloff=5
set laststatus=2
set incsearch

" turn off swap files
set nobackup
set nowritebackup
set noswapfile

set grepprg=rg\ --vimgrep
let g:ctrlsf_ackprg = 'rg'

let g:ale_linters = { 'javascript': ['eslint'], 'elixir': [] }

let g:ale_sign_column_always = 1

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 0

let g:jsdoc_enable_es6 = 1
let g:deoplete#enable_at_startup = 1

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

let NERDTreeIgnore = ['\.orig$', '\.swp$']

let mapleader = ","

let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
set pastetoggle=<leader>o
set spelllang=en

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif"

nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Buffers<CR>
nnoremap <leader>a :Find 
nnoremap <leader>t :TernDef<CR>

map <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
tnoremap <silent> <C-h> <C-W>h
tnoremap <silent> <C-j> <C-W>j
tnoremap <silent> <C-k> <C-W>k
tnoremap <silent> <C-l> <C-W>l
tnoremap <leader><Esc> <C-w>N

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
  \ }
