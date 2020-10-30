"   _   _ ________  _________  _____
"  | | | |_   _|  \/  || ___ \/  __ \
"  | | | | | | | .  . || |_/ /| /  \/
"  | | | | | | | |\/| ||    / | |
"  \ \_/ /_| |_| |  | || |\ \ | \__/\
" (_)___/ \___/\_|  |_/\_| \_| \____/


let mapleader = ";"
let $VIM="/home/kevin/.config/nvim/"

" PLUGINS

call plug#begin('~/.config/nvim/plugged')

" plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" colorschemes
Plug 'jeffkreeftmeijer/vim-dim'

call plug#end()

" use system clipboard
set clipboard=unnamed
set clipboard+=unnamedplus

" set working dir to current file
set autochdir

" enable mouse
set mouse=a

" enable line numbering
set number relativenumber

" basic stuff
set nocompatible
filetype plugin on
set encoding=utf-8


" give path to python for plugins to use
let g:python_host_prog='/usr/bin/python2.7'
let g:python3_host_prog='/usr/bin/python3'


" tree file viewer
let g:netrw_liststyle=3
let g:netrw_banner=0
noremap <leader>e :Vexplore<CR>

syntax enable
colorscheme dim
set background=dark

" fix non transparent background
highlight Normal ctermbg=NONE

" fix weird line number coloring
highlight clear SignColumn
highlight clear LineNr

" make sure filetype is detected
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.bib set filetype=tex
autocmd BufRead,BufNewFile *.md  set filetype=markdown
autocmd BufRead,BufNewFile *.txt set filetype=markdown
autocmd BufRead,BufNewFile *.roff set filetype=groff
autocmd BufRead,BufNewFile *.troff set filetype=groff
autocmd BufRead,BufNewFile *.groff set filetype=groff
autocmd BufRead,BufNewFile *.tmac set filetype=groff
autocmd BufRead,BufNewFile *.ms set filetype=groff


" spellchecking for text documents
autocmd filetype markdown,tex,latex,groff set spell


" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" open horizontal pane to edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" tabs and spaces
autocmd Filetype python set expandtab
autocmd Filetype markdown set expandtab

" ui
set showcmd
filetype indent on

" omnicomplete
set omnifunc=syntaxcomplete#Complete
set complete+=k
set completeopt=menuone,preview,longest

" highlight matching parentheses
set showmatch

" REMAPS
" autoclosing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" markdown auto close formatting
autocmd filetype markdown inoremap * **<left>
autocmd filetype markdown inoremap _ __<left>

" Autocomplete
set wildmode=longest,list,full

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" swithing panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" --- Plugin Configs ----

" toggle goyo
noremap <leader>g :Goyo<CR>

" easy align
" Start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object
nmap ga <Plug>(EasyAlign)

" ---- COMPILE SCRIPTS ----

" md to html with tufte css for notes
" autocmd filetype markdown noremap <leader>c :w <bar> :!pandoc % --mathjax --toc --css  "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.4/tufte.min.css" -s -o %:r.html<CR>

" groff
" compile on save
autocmd InsertLeave *.ms silent! execute "!refer %  | groff -ms -e -p -t -Tps > %:r.ps; ps2pdf %:r.ps %:r.pdf" | redraw!

" LaTeX
autocmd filetype tex,latex noremap <leader>c :w <bar> :!latexmk % <CR>
autocmd filetype tex,latex noremap <leader>p :w <bar> :!latexmk % -pvc <CR> <bar> :!zathura %:r.pdf<CR>

" ---- sourced configs ----

" SNIPPETS
source $VIM/macros.vim

" COC setup
source $VIM/coc.vim

" STATUSLINE
source $VIM/statusline.vim
