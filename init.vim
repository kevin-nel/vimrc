"   _   _ ________  _________  _____
"  | | | |_   _|  \/  || ___ \/  __ \
"  | | | | | | | .  . || |_/ /| /  \/
"  | | | | | | | |\/| ||    / | |
"  \ \_/ /_| |_| |  | || |\ \ | \__/\
" (_)___/ \___/\_|  |_/\_| \_| \____/
"


let mapleader = ";"
" PLUGINS

call plug#begin('~/.config/nvim/plugged')

" plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale', {'for': 'python'}
Plug 'mattn/emmet-vim'

" colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'icymind/NeoSolarized'
Plug 'patstockwell/vim-monokai-tasty'

call plug#end()

" python issues fixer (macosx)
let g:python_host_prog='/Users/kevinnel/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/kevinnel/.pyenv/versions/neovim3/bin/python'

" tree file viewer
let g:netrw_liststyle=3
        
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

colorscheme Neosolarized 
let g:solarized_termcolors=256
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 0

" VIMr
if has('gui_vimr')
    syntax enable
    colorscheme Neosolarized 
    set background=dark
    let g:airline_theme='solarized'
endif

" make sure filetype is detected
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.mdown set filetype=markdown
autocmd BufRead,BufNewFile *.markdown set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown

" enable line numbering
set number relativenumber

" basic stuff 
filetype plugin on
set encoding=utf-8
set nocompatible

" open horizontal pane to edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" tabs and spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" ui
set showcmd
filetype indent on

" omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
inoremap <leader><Tab> <C-X><C-O> 

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

" FZF
let g:fzf_layout = { 'window': 'vsplit enew' }

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
\   'python': ['pep8'],
\   'html' : ['prettier'],
\   'css' : ['prettier'],
\}
let g:ale_lint_on_insert_leave=1

" emmet
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_complete_tag=1

"livereload notes tufte css
autocmd filetype markdown noremap <leader>c :w <bar> :!pandoc % --mathjax --css "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.4/tufte.min.css" -s -o %:r.html<CR>
autocmd filetype markdown noremap <leader>p :w <bar> :!pandoc % --mathjax --css "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.4/tufte.min.css" -s -o %:r.html<CR> <bar> :!open -a Firefox %:r.html <CR>


" LaTeX
autocmd filetype tex,latex noremap <leader>c :w <bar> :!pdflatex % -o %:r.pdf<CR>
autocmd filetype tex,latex noremap <leader>p :w <bar> :!pdflatex % -o %:r.pdf<CR> <bar> :!open -a TeXshop.app %:r.pdf<CR>


" snippets 
" Latex
" math
autocmd Filetype tex,latex,markdown inoremap ;frac \frac{<++>}{<++>}
autocmd Filetype tex,latex,markdown inoremap ;int \int_{<++>}^{<++>}
autocmd Filetype tex,latex,markdown inoremap ;sum \sum_{<++>}^{<++>}

autocmd Filetype tex,latex,markdown  inoremap $ $$<left>
" formatting
autocmd Filetype tex,latex  inoremap ;doc \documentclass[a4page, 12pt]{article}<Enter><++><Enter>\begin{document}<Enter><++><Enter>\end{document}
autocmd Filetype tex,latex  inoremap ;sec \section{<++>}<Enter><Tab>
autocmd Filetype tex,latex  inoremap ;sub \subsection{<++>}<Enter><Tab>
autocmd Filetype tex,latex  inoremap ;eq \begin{equation}<Enter><Tab><++><Enter><BS>\label{eq:<++>}<Enter>\end{equation}
autocmd Filetype tex,latex  inoremap ;fig \begin{figure}[h]<Enter><Tab>\centering<Enter>\includegraphics[width=0.7\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter><BS>\end{figure}
autocmd Filetype tex,latex  inoremap ;pb \pagebreak<Enter>
autocmd Filetype tex,latex  inoremap ;toc \tableofcontents<Enter>
autocmd Filetype tex,latex  inoremap ;pkg \usepackage{<++>}<Enter>


