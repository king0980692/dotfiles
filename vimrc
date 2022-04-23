"
" vim general setting 
"

let mapleader = '\' 

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

call plug#end()

colorscheme Red
let g:airline_theme='raven'
" tagbar
nmap <leader>q :TagbarToggle<CR>
let g:tagbar_position = "topleft vertical"
let g:tagbar_width = max([25, winwidth(0) / 5])+5
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
"highlight TagbarScope ctermfg=Yellow




" gutentags =========

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
 
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')

endif

" LeaderF =========
"
"
"let g:Lf_ShortcutF = '<leader> o'
"let g:Lf_ShortcutB = '<leader> l'
noremap <leader>h :LeaderfSelf<cr>
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>f :LeaderfFile<cr>
noremap <leader>ff :LeaderfFunction<cr>
noremap <leader>fb :LeaderfBufTagAll<cr>
noremap <leader>ft :LeaderfBufTag<cr>
noremap <leader>fl :LeaderfLine<cr> noremap <leader>fw :LeaderfWindow<cr>

let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']

let g:Lf_GtagsSource = 1
let g:Lf_Gtagsconf = '<gtags_root_path>/share/gtags/gtags.conf'
let g:Lf_Gtagslabel = 'native-pygments'

let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsGutentags = 1
" let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'\.LfCache\gtags')
autocmd BufNewFile,BufRead X:/yourdir* let g:Lf_WildIgnore={'file':['*.vcproj', '*.vcxproj','*.o'],'dir':[]}



highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

nnoremap <C-l> <C-]>
nnoremap <C-h> <C-o>

" Configuration example
nnoremap   <leader>t   :FloatermNew<CR>
tnoremap   <leader>t   :FloatermNew<CR>
nnoremap   <leader>s   :FloatermToggle<CR>
tnoremap   <leader>s   <C-\><C-n>:FloatermToggle<CR>


let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

highlight CursorLine ctermbg=125 cterm=bold
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

autocmd BufRead *.py nmap <leader>c :w<Esc>G:r!python %<CR>`.
autocmd BufRead *.sh nmap <leader>c :w<Esc>G:r!sh %<CR>`.

