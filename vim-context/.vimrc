set nu
set mouse=a
set ttymouse=xterm2

call pathogen#infect('bundle/{}')
call pathogen#helptags()

let g:signify_vcs_list = [ 'git' ]

syntax on
" colorscheme desert
highlight Normal ctermfg=blue ctermbg=gray
" hi normal   ctermfg=black  ctermbg=white
set t_ut=
set t_Co=256
set background=light
let moria_style = 'white'
colorscheme moria

" Spelling on off with F8
map <F8> :setlocal spell! spelllang=en_us<CR>

set hlsearch

" on :w remove all trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set ls=2

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
