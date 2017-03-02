call plug#begin('~/.vim/plugged')

"Make sure you use single quotes
"
" On-demand loading
Plug 'dag/vim-fish'
Plug 'elzr/vim-json'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'SirVer/ultisnips'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'dyng/ctrlsf.vim'
Plug 'JamshedVesuna/vim-markdown-preview'

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

let g:ctrlp_user_command= 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.orig"
      \ --ignore "**/*.swp"
      \ --ignore "**/*.swo"
      \ -g ""'

set grepprg=rg\ --vimgrep
let g:ctrlsf_ackprg = 'rg'

let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_sign_column_always = 1

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 0

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

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif"

nnoremap <leader>f :Files<CR>
nnoremap <leader>r :CtrlPClearCache<CR>
nnoremap <leader>g :Buffers<CR>
nnoremap <leader>a :Find 
nnoremap <leader>q :lclose<CR>

map <Leader>n :NERDTreeToggle<CR>

nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --line-number --no-heading --color "always" '.shellescape(<q-args>), 1, <bang>0)
