" ---------------------------------------------------------------------------- "
"                                                                              "
"                                __                                            "
"                        .--.--.|__|.--------.----.----.                       "
"                       _|  |  ||  ||        |   _|  __|                       "
"                      |__\___/ |__||__|__|__|__| |____|                       "
"                                                                              "
"                                .vimrc | zo7                                  "
"                                                                              "
" ---------------------------------------------------------------------------- "


" ------------------------- Load and Set Up Plugins -------------------------- "

if has("nvim")
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

Plug 'ervandew/supertab'
Plug 'maralla/completor.vim'
Plug 'scrooloose/nerdtree'

call plug#end()

" Supertab!
let g:SuperTabDefaultCompletionType = "context"

" NERDTree
let NERDTreeIgnore = ['\.pyc$']


" ------------------------- General Configurations --------------------------- "

"syntax on
set number
set ts=4 sw=4 sts=4
set expandtab
set backspace=indent,eol,start

" Use special characters for tabs and trailing whitespace
set listchars=tab:<-,trail:˙

" Color column 'wall'
set cc=81
"let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=7

" Wrap text, don't linebreak by default
set wrap linebreak list
set textwidth=79
set wrapmargin=80
set formatoptions=l
set foldlevel=80
set foldmethod=syntax

" No characters or colors when splitting windows
set fillchars+=vert:\ 

" Just underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline

" Get scratch areas to go away
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" New windows open below and to the right
:set splitbelow
:set splitright

if has("nvim")
    " Use GUI colors in Neovim
    set termguicolors

    " Change cursor between modes
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

    " 24-bit colors!
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Get 256 colors to work correctly
set t_Co=256


" ------------------------ Context-Specific Settings ------------------------- "

" Don't bold or italicize LaTeX
hi clear texItalStyle
hi clear texBoldStyle


" ------------------------------ Key Mappings -------------------------------- "

" Move cursor by display line, rather than physical
nnoremap j gj
nnoremap k gk

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

" Use space to fold methods in normal/visual mode
nnoremap <space> za
vnoremap <space> zf


" Better vim habits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" -------------------------------- Commands ---------------------------------- "

" Set current window to 85-width
command! Size vert res 85

" Trim trailing whitespace
command! Trim %s/\s\+$//e

" Startup command - Open NERDTree on the left and two windows on the right
" (this would probably be better as a proper function)
command! Start NERDTree|wincmd l|vsp|vert res 85|wincmd l|sp|wincmd h


" ---------------------------- Colorscheme setup ----------------------------- "

if has("nvim")
    colorscheme iceberg
endif
set background=dark

