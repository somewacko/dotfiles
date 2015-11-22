" .vimrc | zo7

filetype off
execute pathogen#infect()
filetype plugin indent on

syntax on
set number
set ts=4 sw=4 sts=0
set expandtab
set backspace=indent,eol,start
set listchars=tab:«-,trail:˙

" Colorscheme of the moment
set background=dark
colorscheme iceberg

" Wrap text, don't linebreak by default
set wrap linebreak list
set textwidth=79
set wrapmargin=80
set formatoptions=l
set cc=

" Highlight text that goes over 80 characters
match ErrorMsg '\%>80v.\+'

" Move cursor by display line, rather than physical
nnoremap j gj
nnoremap k gk
nnoremap <up> g<up>
nnoremap <down> g<down>
inoremap <up> <C-o>gk
inoremap <down> <C-o>gj

set foldlevel=80

" Command to set current window to 85-width
command! Size vert res 85

" No characters when splitting windows
set fillchars+=vert:\ 

" Highlight search
set hlsearch

" Just underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline

" Better vim habits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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

" Neovim settings
if has("nvim")
    " Change cursor between modes
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

    " Change windows from terminal mode easily
    tnoremap <C-w> <C-\><C-n><C-w>

    " Use control+q to get out of terminal mode
    tnoremap <C-q> <C-\><C-n>
endif

" GUI vs Term options
if has("gui_running")

    set guioptions-=e

    " Disable scrollbar
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=Inconsolata\ for\ Powerline:h14

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
endif

" Use Powerline fonts
let g:airline_powerline_fonts = 1


