"
" vim general setting
"

let mapleader = '\'

set pyxversion=3
let g:python3_host_prog = '~/.pyenv/shims/python3'
set cursorline

" au InsertLeave,WinEnter * set cursorline nocursorcolumn
" au InsertEnter,WinLeave * set nocursorline nocursorcolumn
" set background=dark

set nu
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" highlight LineNr ctermfg=grey

" reserve screen after quiting
" set t_ti= t_te=


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
    "Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'majutsushi/tagbar'
    Plug 'flazz/vim-colorschemes'
    "Plug 'voldikss/vim-floaterm'
    "Plug 'easymotion/vim-easymotion'
    Plug 'Yggdroot/indentLine'
    "Plug 'Valloric/YouCompleteMe'
    Plug 'dense-analysis/ale'
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'
    Plug 'preservim/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'uniq_tail'
let g:airline_theme='raven'



colorscheme Red
" UltiSnip
let g:UltiSnipsExpandTrigger="<c-m>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-c>"



" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_auto_hover=''
" nnoremap <c-l> :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=longest,menu
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_warning_symbol = '**'
let g:ycm_error_symbol = '->'

" Check Python files with flake8 and pylint.
let g:ale_linters = {
            \   'python':['flake8', 'pylint']
            \ }
" Fix Python files with autopep8 and yapf.
"let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_fixers = {
            \   '*' : ['remove_trailing_lines','trim_whitespace'],
            \   'python': ['black','yapf', 'isort'],
            \ }
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0

" tagbar
nmap <leader>q :TagbarToggle<CR>
let g:tagbar_position = "topleft vertical"
let g:tagbar_width = max([25, winwidth(0) / 5])+5
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
highlight TagbarScope ctermfg=Yellow




" gutentags =========

let g:gutentags_ctags_exclude = [
        \'~/.vimrc',
        \'~/.zshrc',
        \'~/.tmux.conf'
    \]


" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project','~']

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
" noremap <leader>h :LeaderfSelf<cr>
" noremap <leader>fm :LeaderfMru<cr>
" noremap <leader>f :LeaderfFile<cr>
" noremap <leader>ff :LeaderfFunction<cr>
" noremap <leader>fb :LeaderfBufTagAll<cr>
" noremap <leader>ft :LeaderfBufTag<cr>
" noremap <leader>fl :LeaderfLine<cr> noremap <leader>fw :LeaderfWindow<cr>

" let g:Lf_WorkingDirectoryMode = 'AF'
" let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
"
" let g:Lf_GtagsSource = 1
" let g:Lf_Gtagsconf = '<gtags_root_path>/share/gtags/gtags.conf'
" let g:Lf_Gtagslabel = 'native-pygments'
"
" let g:Lf_GtagsAutoGenerate = 0
" let g:Lf_GtagsGutentags = 1
" let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'\.LfCache\gtags')
autocmd BufNewFile,BufRead X:/yourdir* let g:Lf_WildIgnore={'file':['*.vcproj', '*.vcxproj','*.o'],'dir':[]}



highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
""
nnoremap <C-l> <C-]>
nnoremap <C-h> <C-o>

" highlight CursorLine ctermbg=21 cterm=bold
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=125

hi Search term=reverse cterm=underline,bold  ctermbg=25 ctermfg=Yellow

" set updatetime=10

function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction


autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

" highlight Pmenu ctermbg=gray guibg=gray ctermfg=White
highlight Pmenu ctermbg=56 ctermfg=Yellow
highlight PmenuSel ctermbg=259
" autocmd BufRead *.py nmap <leader>c :w<Esc>G:r!python %<CR>`.
" Nerd_Commenter setting
filetype plugin on
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" autocmd BufRead *.py nmap <leader>c :w<Esc>G:r!python %<CR>`.

" Nerd_Commenter setting
filetype plugin on
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
