" .vimrc | zo7

filetype off
execute pathogen#infect()
filetype plugin indent on

set nocompatible
set encoding=utf-8

syntax on
set number
set ts=4 sw=4 sts=0
set expandtab
set backspace=indent,eol,start
set listchars=tab:«-,trail:˙
set list

set wrap linebreak
set textwidth=80
set colorcolumn=80

set foldmethod=indent
set foldlevel=99

" Supertab!
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

if has("gui_running")

    " Disable scrollbar
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=Inconsolata\ for\ Powerline:h14

    set background=dark
    colorscheme base16-ateliercave

    " Quick commands for fonts
    command! FontReset set guifont=Inconsolata\ for\ Powerline:h14
    command! FontFur set guifont=monofur\ for\ Powerline:14 " for fun~

    " Silence bell
    set noerrorbells
    set novisualbell
    set t_vb=
    autocmd! GUIEnter * set vb t_vb=

else
    set t_Co=256
    set background=dark
    colorscheme grb256
endif

let g:airline_powerline_fonts = 1

