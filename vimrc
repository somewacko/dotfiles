" ---------------------------------------------------------------------------- "
"                                __                                            "
"                        .--.--.|__|.--------.----.----.                       "
"                       _|  |  ||  ||        |   _|  __|                       "
"                      |__\___/ |__||__|__|__|__| |____|                       "
"                                                                              "
"                                .vimrc | zo7                                  "
"                                                                              "
" ---------------------------------------------------------------------------- "


" ------------------------- Load and Set Up Plugins -------------------------- "

filetype off
execute pathogen#infect()
filetype plugin indent on

" Supertab!
let g:SuperTabDefaultCompletionType = "context"

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

" Set Python paths
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'


" ------------------------- General Configurations --------------------------- "

syntax on
set number
set ts=4 sw=4 sts=4
set expandtab
set backspace=indent,eol,start

" Use special characters for tabs and trailing whitespace
set listchars=tab:<-,trail:˙

" Colorscheme of the moment
set background=dark
colorscheme gotham

" Color column 'wall'
set cc=80
let &colorcolumn=join(range(81,999),",")

" Wrap text, don't linebreak by default
set wrap linebreak list
set textwidth=79
set wrapmargin=80
set formatoptions=l
set foldlevel=80

" No characters when splitting windows
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


" ---------------------- GUI/Terminal/Neovim Settings ------------------------ "

if has("nvim")
    " Change cursor between modes
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

    " 24-bit colors!
    let $NVIM_TUI_ENABLE_TRUE_COLOR=0
    let &t_8f="\e[38;2;%ld;%ld;%ldm"
    let &t_8b="\e[48;2;%ld;%ld;%ldm"

    " For whatever reason terminal colors don't work in neovim 24-bit...
    " These set terminal colors to Gotham-themed colors.
    let g:terminal_color_0  = '#0c1014'
    let g:terminal_color_1  = '#11151c'
    let g:terminal_color_2  = '#091f2e'
    let g:terminal_color_3  = '#0a3749'
    let g:terminal_color_4  = '#245361'
    let g:terminal_color_5  = '#599cab'
    let g:terminal_color_6  = '#99d1ce'
    let g:terminal_color_7  = '#d3ebe9'

    let g:terminal_color_8  = '#c23127'
    let g:terminal_color_9  = '#d26937'
    let g:terminal_color_10 = '#edb443'
    let g:terminal_color_11 = '#888ca6'
    let g:terminal_color_12 = '#4e5166'
    let g:terminal_color_13 = '#195466'
    let g:terminal_color_14 = '#33859e'
    let g:terminal_color_15 = '#2aa889'
endif


if has("gui_running")

    set guioptions-=e

    " Disable scrollbar
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=Inconsolata\ for\ Powerline:h12

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

