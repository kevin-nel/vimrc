"   _   _ ________  _________  _____
"  | | | |_   _|  \/  || ___ \/  __ \
"  | | | | | | | .  . || |_/ /| /  \/
"  | | | | | | | |\/| ||    / | |
"  \ \_/ /_| |_| |  | || |\ \ | \__/\
" (_)___/ \___/\_|  |_/\_| \_| \____/
" PLUGINS

call plug#begin('~/.config/nvim/plugged')
" plugins
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'Chiel92/vim-autoformat'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'python-mode/python-mode', {'branch': 'develop'}

" colorschemes
Plug 'acarapetis/vim-colors-github'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'junegunn/seoul256.vim'

call plug#end()

" python issues fixer (macosx)
let g:python_host_prog='/Users/kevinnel/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/kevinnel/.pyenv/versions/neovim3/bin/python'

" tree file viewer
let g:netrw_liststyle=3

" GENERAL
" enable syntax processing and add colorscheme
" change theme based on time of day
syntax enable
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'
" enable true color
if (empty($TMUX))
        if(has("nvim"))
                let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        if (has("termguicolors"))
                set termguicolors
        endif
endif
" gruvbox setup
g:gruvbox_contrast_dark=medium
g:gruvbox_contrast_light=hard

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<cr>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" enable line numbering
set number relativenumber

" open horizontal pane to edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" enable autocomplete
set wildmode

" tabs and spaces
set tabstop=4
set softtabstop=4
set expandtab

" ui
set showcmd
filetype indent on
set wildmenu

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

"inoremap <backspace> <nop>
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
" escape key
imap <`> <Esc>
" swithing panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" SHORTCUTS
" toggle goyo
noremap <leader>g :Goyo<CR>
" autoformatter
noremap <leader>f :Autoformat<CR>
