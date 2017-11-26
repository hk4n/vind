" enable mouse
set mouse=a
set ttymouse=xterm2

" screen fix for auto :set paste
if match($TERM, "screen")!=-1
    set term=xterm
endif

" turn on pathogen for loading all vim plugins
call pathogen#infect('bundle/{}')
call pathogen#helptags()

" set leader to comma
let mapleader = ","

" turn on visible row numbers
set nu

" enabling features which are not Vi compatible
set nocp

" turn on syntax highlighting
syntax on

" color and theme settings
highlight Normal ctermfg=blue ctermbg=gray
set t_ut=
set t_Co=256
set background=light
let moria_style = 'white'
colorscheme moria

" spelling on off with F8
map <F8> :setlocal spell! spelllang=en_us<CR>

" highlighting search matches
set hlsearch

" turn on detection for plugin and indent at once
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" show a status line even when only one window is shown
set ls=2
