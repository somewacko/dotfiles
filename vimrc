" ---- ---- ---- ---- ---- ---- ---- ----
"               vimrc | zo7
" ---- ---- ---- ---- ---- ---- ---- ----



" ---- Load and Set Up Plugins

filetype off
execute pathogen#infect()
filetype plugin indent on

" Supertab!
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Use Powerline fonts
let g:airline_powerline_fonts = 1

" Recommended settings for starting with Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" ---- General Configurations

syntax on
set number
set ts=4 sw=4 sts=0
set expandtab
set backspace=indent,eol,start

" Use special characters for tabs and trailing whitespace
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
set foldlevel=80

" No characters when splitting windows
set fillchars+=vert:\ 

" Highlight search
set hlsearch

" Just underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline



" ---- Context-Specific Settings

" Show embedded JS files as html
au BufRead,BufNewFile *.ejs set filetype=html

" No wrap, no color column, 2-space indent for html
au BufRead,BufNewFile *.html,*.ejs set nowrap nolinebreak ts=2 sw=2 colorcolumn=

" Don't bold or italicize LaTeX
hi clear texItalStyle
hi clear texBoldStyle



" ---- Key Mappings

" Move cursor by display line, rather than physical
nnoremap j gj
nnoremap k gk
nnoremap <up> g<up>
nnoremap <down> g<down>
inoremap <up> <C-o>gk
inoremap <down> <C-o>gj

" Change window with C-<direction>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
if has("nvim")
    " Change windows from terminal mode easily
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

" Also create windows by just holding ctrl
nnoremap <C-s> <C-w>s
nnoremap <C-v> <C-w>v
if has("nvim")
    " Also do it in terminal mode
    tnoremap <C-s> <C-\><C-n><C-w>s
    tnoremap <C-v> <C-\><C-n><C-w>v
endif

" In neovim, use C-q to get to normal mode (It turns out that
" remapping Esc to do this is a bad idea...)
if has("nvim")
    tnoremap <C-q> <C-\><C-n>
endif

" Better vim habits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>



" ---- Commands

" Set current window to 85-width
command! Size vert res 85

" Trim trailing whitespace
command! Trim %s/\s\+$//e

" Startup command - Open NERDTree on the left and two windows on the right
" (this would probably be better as a proper function)
command! Start NERDTree|wincmd l|vsp|vert res 85|wincmd l|sp|wincmd h



" ---- GUI/Terminal/Neovim Settings

if has("nvim")
    " Change cursor between modes
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

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

else " Terminal Settings

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



