"   _   _ ________  _________  _____
"  | | | |_   _|  \/  || ___ \/  __ \
"  | | | | | | | .  . || |_/ /| /  \/
"  | | | | | | | |\/| ||    / | |
"  \ \_/ /_| |_| |  | || |\ \ | \__/\
" (_)___/ \___/\_|  |_/\_| \_| \____/


" % TO DO % "
" 1. setup auto complete for * and _ in markdown 
" 2. setup coc.vim 
" 3. spell check shortcut
" 4. use tabs (set path etc.)
" 5. setup mermaid for markdown compilation
" 6. externalise compile scripts (figure out how to run latekmk in the
" background)

let mapleader = ";"

" PLUGINS

call plug#begin('C:\Users\Kevin Nel\Sync\Notes\configs\nvim')

" plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
" Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" colorschemes
Plug 'morhetz/gruvbox'
Plug 'icymind/NeoSolarized'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/base16-vim'
Plug 'shinchu/lightline-gruvbox.vim'
call plug#end()

" use system clipboard
set clipboard=unnamed
set clipboard+=unnamedplus

" set wordwrapping
"set wrap linebreak nolist
"set wrapmargin=79
"set textwidth=79
"set formatoptions=tjncroql

" set working dir to current file
set autochdir

" enable mouse
set mouse=a

" python issues fixer (macos)
""let g:python_host_prog='/Users/kevinnel/.pyenv/versions/neovim2/bin/python'
""let g:python3_host_prog='/Users/kevinnel/.pyenv/versions/neovim4/bin/python'

" windows
let g:python_host_prog='C:\Python27\'
let g:python3_host_prog='C:\Users\Kevin Nel\AppData\Local\Programs\Python\Python37\'

" linux
"let g:python_host_prog='/usr/bin/python2.7'
"let g:python3_host_prog='/usr/bin/python3.6'

" tree file viewer
let g:netrw_liststyle=3
noremap <leader>e :Vexplore<CR>
        
" GENERAL

" enable syntax processing and add colorscheme
"" enable true color
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
colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"

set noshowmode
" fonts
" windows
if has("gui_running")
  if has("gui_win32")
    set guifont=Fira\ Code:h11:cANSI
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	colorscheme base16-unikitty-dark
  endif
endif

" powerline fonts
let g:airline_powerline_fonts = 1

" make sure filetype is detected
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.bib set filetype=tex
autocmd BufRead,BufNewFile *.bbl set filetype=tex
autocmd BufRead,BufNewFile *.mdown set filetype=markdown
autocmd BufRead,BufNewFile *.markdown set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
autocmd BufRead,BufNewFile *.txt set filetype=markdown

" enable line numbering
set number relativenumber

"add left margin
"set foldcolumn=1

" code folds
"set foldmethod=indent

" basic stuff 
filetype plugin on
set encoding=utf-8
set nocompatible

" open horizontal pane to edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" tabs and spaces
set tabstop=4 softtabstop=0  shiftwidth=4 smarttab
autocmd Filetype python set expandtab
" ui
set showcmd
filetype indent on

" omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
inoremap <leader><Tab> <C-p> 
set complete+=k
set completeopt=menuone,preview,longest

" highlight matching parentheses
set showmatch

" REMAPS
" disable arrow keys and backspace in insert mode
"inoremap <up> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"inoremap <down> <nop>
"
"nnoremap <up> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"nnoremap <down> <nop>

" beginning and end
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" autoclosing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" markdown formatting
autocmd filetype markdown inoremap * **<left>
autocmd filetype markdown inoremap _ __<left>

" spellchecking for text documents
autocmd filetype markdown,tex,latex set spell 

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

" CONFIG

" SHORTCUTS
" toggle goyo
noremap <leader>g :Goyo<CR>

" easy align
" Start interactive EasyAlign in visual mode 
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object 
nmap ga <Plug>(EasyAlign)

" ale fix
noremap <leader>f :ALEFix<CR>
" ale completion
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black'],
\   'html' : ['prettier'],
\   'css' : ['prettier'],
\}
let g:ale_lint_on_insert_leave=1

" emmet
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_complete_tag=1

" COMPILE SCRIPTS
" livereload notes tufte css
autocmd filetype markdown noremap <leader>t :w <bar> :!pandoc % --mathjax --toc --css  "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.4/tufte.min.css" -s -o %:r.html<CR>
autocmd filetype markdown noremap <leader>b :w <bar> :!pandoc % --mathjax --toc -s -o %:r.html<CR> <bar> :!firefox %:r.html <CR>


" LaTeX
autocmd filetype tex,latex noremap <leader>c :w <bar> :!latexmk % <CR>
autocmd filetype tex,latex noremap <leader>p :w <bar> :!latexmk % -pvc <CR> <bar> :!zathura %:r.pdf<CR>


" snippets 
" markdown
autocmd Filetype markdown inoremap <leader>i	![<++>](<++>)
autocmd Filetype markdown inoremap <leader>l	[<++>](<++>)
autocmd Filetype markdown inoremap <leader>c	```<++><ESC>o<++><ESC>o```
" Latex
" math
autocmd Filetype tex,latex,markdown inoremap ;frac      \frac{<++>}{<++>}
autocmd Filetype tex,latex,markdown inoremap ;int       \int_{<++>}^{<++>}
autocmd Filetype tex,latex,markdown inoremap ;sum       \sum_{<++>}^{<++>}
autocmd Filetype tex,latex,markdown  inoremap $ $$<left>

" formatting
autocmd Filetype tex,latex  inoremap ;doc       \documentclass[a4page, 12pt]{article}<Enter><++><Enter>\begin{document}<Enter><++><Enter>\end{document}
autocmd Filetype tex,latex  inoremap ;rep      <ESC>:read C:\Users\Kevin Nel\Sync\Notes\configs\nvim\snippets\latex\tuks.tex<CR> 
autocmd Filetype tex,latex  inoremap ;sec       \section{<++>}<ESC>k
autocmd Filetype tex,latex  inoremap ;sub       \subsection{<++>}<Enter><Tab>
autocmd Filetype tex,latex  inoremap ;ssub       \subsubsection{<++>}<Enter><Tab>
autocmd Filetype tex,latex  inoremap ;eq        \begin{equation}<Enter><Tab><++><Enter><BS>\label{eq:<++>}<Enter>\end{equation}
autocmd Filetype tex,latex  inoremap ;ea        \begin{align*}<Enter><Tab><++><Enter><BS>\end{align*}

autocmd Filetype tex,latex  inoremap ;fig       \begin{figure}[h]<Enter><Tab>\centering<Enter>\includegraphics[width=0.7\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter><BS>\end{figure}
autocmd Filetype tex,latex  inoremap ;pb        \pagebreak<Enter>
autocmd Filetype tex,latex  inoremap ;toc       \tableofcontents<Enter>
autocmd Filetype tex,latex  inoremap ;pkg       \usepackage{<++>}<Enter>
autocmd Filetype tex,latex  inoremap ;er      	~\eqref{eq:<++>}~<ESC>2ba
autocmd Filetype tex,latex  inoremap ;r      	~\ref{fig:<++>}~<ESC>2ba
autocmd Filetype tex,latex  inoremap ;c			~\cite{<++>}~<ESC>2ba
autocmd Filetype tex,latex  inoremap ;b			\begin{<++>}<Enter>\end{<++>}<ESC>O


