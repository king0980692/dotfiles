let s:curdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &rtp.=','.s:curdir
" Set leader key
let mapleader = '\' 

" set python path

"set pyxversion=3
"let g:python3_host_prog = '/usr/bin/python3'

" Load configs
for fpath in split(globpath(expand(s:curdir.'/.config/nvim/config'), '*.vim'), '\n')
   exe 'source' fpath
endfor


" Options setup
" ============================================================={{{
"
" 使用顏色主題 
"
set bg=dark
"colorscheme dracula
"colorscheme medic_chalk
"colorscheme primary
"可以使用滑鼠控制
set mouse=a
" 顯示行號/相對行號
set nu
"set relativenumber
" 使vim不相容vi
set nocompatible
" 切換tab(buffer)時，之前的文件只是在背景不會消失
set hidden
set encoding=UTF-8
" 使用true color
set termguicolors
" Highlight curcur
" set cursorcolumn
set cursorline
" Max pattern match memory
set maxmempattern=5000
set lazyredraw
set autoread
set hlsearch
set showmode
" Code fold
"set foldmethod=indent
set foldnestmax=2
"set foldlevel=99
" Default tab width = 4 space
set tabstop=4
set shiftwidth=4
set expandtab
"set autoindent
" backspace
"set backspace=indent,eol,start " backspace over everything in insert mode
" time in milliseconds to wait for a mapped sequence to complete
set timeoutlen=700
" reserve screen after quiting
set t_ti= t_te=


" clipboard
" set clipboard=unnamed 
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300
"
" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c


"always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif



