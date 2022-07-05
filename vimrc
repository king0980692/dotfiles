"=======================================================================
" Automatic Install
"=======================================================================

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  
  " Install all the plugins
  autocmd VimEnter * PlugInstall
endif


"
" vim general setting 
"

let mapleader = '.' 

set pyxversion=3
let g:python3_host_prog = '~/.pyenv/shims/python3'
set cursorline

au InsertLeave,WinEnter * set cursorline nocursorcolumn
au InsertEnter,WinLeave * set nocursorline nocursorcolumn
" set background=dark

set nu
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" highlight LineNr ctermfg=grey

" reserve screen after quiting
" set t_ti= t_te=

set linebreak
set showbreak=›››\     " there's a trailing <Space>, here.

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set mouse=a
" =============================

call plug#begin()

    Plug 'ludovicchabant/vim-gutentags'
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'majutsushi/tagbar'
    Plug 'flazz/vim-colorschemes'
    Plug 'voldikss/vim-floaterm'
    Plug 'easymotion/vim-easymotion'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'preservim/nerdcommenter'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'


call plug#end()

" UltiSnips
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:UltiSnipsEditSplit="vertical"


colorscheme gentooish

" Airline
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_inactive_collapse=1
let g:airline#extensions#taboo#enabled = 1
let g:airline_section_c = '%t'

" remove the filetype part
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z = '%{strftime("%a %d %b %H:%M")}'

" remove separators for empty sections
let g:airline_skip_empty_sections = 1

" tagbar
nmap <leader>q :TagbarToggle<CR>
let g:tagbar_position = "topleft vertical"
let g:tagbar_width = max([25, winwidth(0) / 5])+5
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
"highlight TagbarScope ctermfg=Yellow




" gutentags =========

" gutentags 搜索工程目錄的標誌，碰到這些文件/目錄名就停止向下一級目錄遞迴搜尋
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
 
" 所生成的tag名稱檔案
let g:gutentags_ctags_tagfile = '.tags'

" 將自動生成的 tags 文件全部放入 ~/.cache/tags 路徑中，避免汙染專案結構
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的參數
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 檢測 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')

endif

" ctags used these Map 
nnoremap <C-l> <C-]>
nnoremap <C-h> <C-o>

" MMAP C-e to end of line
map <C-e> <ESC>$
imap <C-e> <ESC>A


nnoremap <space> za

"========== Hightlight the cursorline ==============
"set relativenumber
set nu
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight LineNr ctermfg=grey

au InsertLeave,WinEnter * set cursorline nocursorcolumn
au InsertEnter,WinLeave * set nocursorline nocursorcolumn
set cursorline

highlight LineNr term=NONE cterm=NONE ctermfg=WHITE ctermbg=BLACK
"highlight CursorLine ctermbg=132 cterm=bold term=bold
highlight CursorLine guibg=Grey64 cterm=bold term=bold
highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
highlight CursorLineNR ctermbg=blue ctermfg=231 cterm=bold

highlight Pmenu ctermbg=61 guibg=gray ctermfg=Yellow
highlight PmenuSel ctermbg=123 guibg=gray cterm=bold



hi Search term=reverse cterm=underline,bold  ctermbg=25 ctermfg=Yellow
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

"autocmd BufRead *.py nmap <leader>c :w<Esc>G:r!python %<CR>`.
"autocmd BufRead *.sh nmap <leader>c :w<Esc>G:r!sh %<CR>`.
nnoremap <C-q>n :bn <CR>
nnoremap <C-q>p :bp <CR>
nnoremap <C-q>o :bp <CR>
nnoremap <C-q>w :bw <CR>
nnoremap <C-q>l :Buffers <CR>

