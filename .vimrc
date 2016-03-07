set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround.git'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'msanders/snipmate.vim'
Plugin 'easymotion/vim-easymotion.git'
Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8.git'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=" "
set pastetoggle=<F10>

" write & quick shortcuts
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" open/close the quickfix window
nmap <leader>x :cclose<cr>

" splits
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" split movements
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h

" hide search
nnoremap <leader>u :nohlsearch<CR>

" reload vim settings
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Run python (nose) tests
map <F5> <Esc>:!clear;nosetests -d<CR>

" Run make in current dir
map <F6> <Esc>:!clear;make<CR>


""" General Config
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set showmatch               " Briefly jump to a paren once it's balanced
set wrap                    " Wrap text
set linebreak               " don't wrap textin the middle of a word
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set textwidth=80            " Lines are automatically wrapped after 80 columns
set ls=2                    " allways show status line
set showcmd                 " show incomplete normal mode commands as i type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " use [+]/[ro]/[w] for modified/readonly/written.
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
"
" don't bell or blink
set noerrorbells
set vb t_vb=

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Theme
set background=dark
colorscheme solarized

" Emmet
let g:user_emmet_leader_key = '<c-e>'

"Git Fugitive
map <leader>gw :Gwrite<CR>
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
map <leader>gc :Gcommit<CR>

" YouCompleteMe
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_autoclose_preview_window_after_insertion = 1


" CTRL-P
set wildignore+=*.pyc,*.swp,*/env/*,*/node_modules/*,*/.git/*
" let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <leader>p :CtrlP<CR>

" SimplyFold
" let g:SimpylFold_docstring_preview=1

" vim-airline
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'unicode'
set t_Co=256

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_loc_list_height=5


" Python
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
au BufNewFile,BufRead *.py set colorcolumn=80
autocmd BufWritePre *.py :%s/\s\+$//e

let python_highlight_all=1

" Web
let g:javascript_enable_domhtmlcss = 1
