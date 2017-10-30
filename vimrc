"           __
"   .--.--.|__|.--------.----.----.
"  _|  |  ||  ||        |   _|  __|
" |__\___/ |__||__|__|__|__| |____|
"

" --- load plugins

call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'hdima/python-syntax'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'maralla/completor.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

call plug#end()

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

let NERDTreeIgnore = ['\.pyc$']

" use plain characters instead of arrows (no fun over ssh)
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:ale_lint_on_enter = 1
let g:ale_lint_delay = 500

let g:lightline = {
\ 'colorscheme': 'iceberg',
\ }
set laststatus=2
set noshowmode

autocmd User ALELint call s:MaybeUpdateLightline()

function! s:MaybeUpdateLightline()
    if exists('#lightline')
        call lightline#update()
    end
endfunction

let g:python_highlight_builtins = 1

" --- general

syntax on
set number
set ts=4 sw=4 sts=4
set expandtab
set backspace=indent,eol,start

" use special characters for tabs and trailing whitespace
set listchars=tab:<-,trail:-

" color column 'wall'
set cc=81
"let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=7

" wrap text, don't linebreak by default
set wrap linebreak list
set textwidth=79
set wrapmargin=80
set formatoptions=l
set foldlevel=80
set foldmethod=syntax

" no characters or colors when splitting windows
set fillchars+=vert:\ 

" just underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline

" get scratch areas to go away
"autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" new windows open below and to the right
:set splitbelow
:set splitright

" true color
set termguicolors
set t_Co=256

" don't bold or italicize LaTeX
hi clear texItalStyle
hi clear texBoldStyle

" colorscheme
set background=dark
colorscheme iceberg


" --- key mappings

" move cursor by display line, rather than physical
nnoremap j gj
nnoremap k gk

" change window with C-<direction>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" also create windows by just holding ctrl
nnoremap <C-s> <C-w>s
nnoremap <C-v> <C-w>v

" use space to fold methods in normal/visual mode
nnoremap <space> za
vnoremap <space> zf

" better vim habits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" --- commands

" trim trailing whitespace
command! Trim %s/\s\+$//e


" --- etc

" generate help files
packloadall
silent! helptags ALL
