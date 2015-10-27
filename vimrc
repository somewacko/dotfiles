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

" Wrap text, don't linebreak by default
set wrap linebreak list
set textwidth=79
set colorcolumn=80
set wrapmargin=80
set formatoptions=l

" Move cursor by display line, rather than physical
nnoremap j gj
nnoremap k gk
nnoremap <up> g<up>
nnoremap <down> g<down>
inoremap <up> <C-o>gk
inoremap <down> <C-o>gj

set foldmethod=indent
set foldlevel=80

" Supertab!
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Show embedded JS files as html
au BufRead,BufNewFile *.ejs set filetype=html

" No wrap, no color column, 2-space indent for html
au BufRead,BufNewFile *.html,*.ejs set nowrap nolinebreak ts=2 sw=2 colorcolumn=

" Command to trim trailing whitespace
command! Trim %s/\s\+$//e

" Recommended settings for starting with Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Don't bold or italicize LaTeX
hi clear texItalStyle
hi clear texBoldStyle


if has("gui_running")

    set guioptions-=e

    " Disable scrollbar
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=Inconsolata\ for\ Powerline:h14

    set background=dark
    colorscheme jellybeans

    " Quick commands for fonts
    command! FontReset set guifont=Inconsolata\ for\ Powerline:h14
    command! FontFur set guifont=Monofur\ for\ Powerline:h15 " for fun~

    " Silence bell
    set noerrorbells
    set novisualbell
    set t_vb=
    autocmd! GUIEnter * set vb t_vb=

else
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif

    " Get 256 colors to work correctly
    set t_Co=256

    set background=dark
    colorscheme jellybeans
endif

let g:airline_powerline_fonts = 1

