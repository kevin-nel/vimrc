"   _   _ ________  _________  _____
"  | | | |_   _|  \/  || ___ \/  __ \
"  | | | | | | | .  . || |_/ /| /  \/
"  | | | | | | | |\/| ||    / | |
"  \ \_/ /_| |_| |  | || |\ \ | \__/\
" (_)___/ \___/\_|  |_/\_| \_| \____/
"
" PLUGINS

call plug#begin('~/.config/nvim/plugged')

" plugins
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" colorschemes
Plug 'vim-airline/vim-airline-themes'
" Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'
Plug 'patstockwell/vim-monokai-tasty'

call plug#end()

" python issues fixer (macosx)
let g:python_host_prog='/Users/kevinnel/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/kevinnel/.pyenv/versions/neovim3/bin/python'

" tree file viewer
let g:netrw_liststyle=3

" GENERAL
" enable syntax processing and add colorscheme

let g:airline_theme=''
" let g:solarized_termcolors=256
" enable true color
if (empty($TMUX))
        if(has("nvim"))
                let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        if (has("termguicolors"))
                set termguicolors
        endif
endif

syntax enable
set background=dark

let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
let g:airline_theme='monokai_tasty'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" enable line numbering
set number relativenumber

" open horizontal pane to edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" tabs and spaces
set tabstop=4
set softtabstop=4
set expandtab

" ui
set showcmd
filetype indent on


" highlight matching parentheses
set showmatch

" REMAPS
" disable arrow keys and backspace in insert mode
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <down> <nop>

nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>

" move vertically by visual line
nnoremap j gj
nnoremap k gk
" beginning and end
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" autoclosing brackets
noremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" swithing panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" SHORTCUTS
" toggle goyo
noremap <leader>g :Goyo<CR>

" ale fix
noremap <leader>f :ALEFix<CR>
" ale completion
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['pep8'],
\   'html' : ['prettier'],
\   'css' : ['prettier'],
\}
let g:ale_lint_on_insert_leave=1

" emmet
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_complete_tag=1
