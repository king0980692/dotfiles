call plug#begin()
" ------------------- start of plug ---------------------------------

" If nvim-plug
" ================================================
if !has('nvim')
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Fancy start-up page
" ================================================
Plug 'mhinz/vim-startify'
let g:startify_padding_left = 20
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'z': '~/.zshrc'}, {'p': '~/.config/nvim/config/01-plug.vim'}, {'m': '~/.config/nvim/config/02-keybinding.vim'}]
let g:startify_enable_special = 0
let g:startify_files_number = 15
let g:startify_commands = [
            \ ['Status of Plugins', 'PlugStatus'],
            \ ['Install Plugins', 'PlugInstall'],
            \ ['Clean Plugins', 'PlugClean']
            \ ]
let g:startify_list_order = [
            \ [repeat(' ', g:startify_padding_left - 4) . 'Recent Files'],
            \ 'files',
            \ [repeat(' ', g:startify_padding_left - 4) . 'Sessions:'],
            \ 'sessions',
            \ [repeat(' ', g:startify_padding_left - 4) . 'Bookmarks:'],
            \ 'bookmarks',
            \ [repeat(' ', g:startify_padding_left - 4) . '常用命令:'],
            \ 'commands',
            \ ]
let g:start_indent_str = repeat(' ', (100 - strwidth('░██████╗░░░░░░░██╗░░░██╗██╗███╗░░░███╗')) / 2)
let g:start_header = [
                \ g:start_indent_str . '██╗░░░░░███████╗░█████╗░███╗░░██╗',
                \ g:start_indent_str . '██║░░░░░██╔════╝██╔══██╗████╗░██║',
                \ g:start_indent_str . '██║░░░░░█████╗░░██║░░██║██╔██╗██║',
                \ g:start_indent_str . '██║░░░░░██╔══╝░░██║░░██║██║╚████║',
                \ g:start_indent_str . '███████╗███████╗╚█████╔╝██║░╚███║',
                \ g:start_indent_str . '╚══════╝╚══════╝░╚════╝░╚═╝░░╚══╝',
                \ '',
                \ repeat('═', 100)
                \]
" let g:start_header = [
" 			\ g:start_indent_str . '██╗░░░░░███████╗░█████╗░███╗░░██╗░░░░░░██╗░░░██╗██╗███╗░░░███╗',
" 			\ g:start_indent_str . '██║░░░░░██╔════╝██╔══██╗████╗░██║░░░░░░██║░░░██║██║████╗░████║',
" 			\ g:start_indent_str . '██║░░░░░█████╗░░██║░░██║██╔██╗██║█████╗╚██╗░██╔╝██║██╔████╔██║',
" 			\ g:start_indent_str . '██║░░░░░██╔══╝░░██║░░██║██║╚████║╚════╝░╚████╔╝░██║██║╚██╔╝██║',
" 			\ g:start_indent_str . '███████╗███████╗╚█████╔╝██║░╚███║░░░░░░░░╚██╔╝░░██║██║░╚═╝░██║',
" 			\ g:start_indent_str . '╚══════╝╚══════╝░╚════╝░╚═╝░░╚══╝░░░░░░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝',  
" \]
hi link StartifyHeader StartifySection

function! s:filter_header(lines) abort
    let l:longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let l:centered_lines = map(copy(a:lines),
                \ 'repeat('' '', (&columns / 2) - (l:longest_line / 2)) . v:val')
    return l:centered_lines
endfunction
let g:startify_custom_header = s:filter_header(g:start_header)

" tabular
Plug 'godlygeek/tabular'

" markdown
Plug 'plasticboy/vim-markdown'

" indentLine
" ================================================
Plug 'Yggdroot/indentLine'

" surrond.vim
" ================================================
Plug 'tpope/vim-surround' 


" Color Themes
" ================================================
Plug 'dracula/vim', { 'as': 'dracula' }
let g:dracula_bold = 1
let g:dracula_italic = 0
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_inverse = 1
let g:dracula_colorterm = 1
"set background=dark


" ================================================
Plug 'ParamagicDev/vim-medic_chalk'
let g:indentLine_color_term = 239



" ================================================
Plug 'google/vim-colorscheme-primary'

" Lightline
" ================================================
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
set laststatus=2
let g:lightline = {
    \'colorscheme': 'wombat', 
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'gitbranch': 'fugitive#head'
    \ },
    \ 'separator': {
    \   'left': '',
    \   'right': ''
    \ },
    \ 'subseparator': {
    \   'left': '',
    \   'right': ''
    \ }
    \ }
" Show readonly
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

" Show git branch
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

" Git blame message
function! LightlineGitBlame() abort
    let blame = get(b:, 'coc_git_blame', '')
    " return blame
    return winwidth(0) > 120 ? blame : ''
endfunction

" Get current funtion symbol
function! CocCurrentFunction()
    let currentFunctionSymbol = get(b:, 'coc_current_function', '')
    return currentFunctionSymbol !=# '' ? " " .currentFunctionSymbol : ''
endfunction

let g:lightline = {
            \ 'colorscheme': 'dracula',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch'],
            \             [ 'readonly', 'relativepath', 'modified' ],
            \             [ 'cocstatus', 'currentfunction' ] ],
            \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
            \              [ 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'fileformat', 'fileencoding', 'filetype' ], ['blame'] ]
            \ },
            \ 'component_function': {
            \   'readonly': 'LightlineReadonly',
            \   'gitbranch': 'LightlineFugitive',
            \   'cocstatus': 'coc#status',
            \   'blame': 'LightlineGitBlame',
            \   'currentfunction': 'CocCurrentFunction',
            \ },
            \ }

" Auto Pair
" ============================================================
" Plug 'jiangmiao/auto-pairs'

" Rainbow parentheses
" ==========================================================
Plug 'luochen1990/rainbow'
let g:rainbow_active = 0
let g:rainbow_conf = {
            \	'guifgs':   ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \	'operators': '_,_',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \	'separately': {
            \		'*': {},
            \		'tex': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \		},
            \		'lisp': {
            \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \		},
            \		'vim': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \		},
            \		'html': {
            \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \		},
            \		'css': 0,
            \	}
            \}

" Defx 
" ============================================================
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


" Defx git
Plug 'kristijanhusak/defx-git'
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

" Defx icons
" Requires nerd-font, install at https://github.com/ryanoasis/nerd-fonts or
" brew cask install font-hack-nerd-font
" Then set non-ascii font to Driod sans mono for powerline in iTerm2
Plug 'kristijanhusak/defx-icons'
" disbale syntax highlighting to prevent performence issue
let g:defx_icons_enable_syntax_highlight = 1

" }}}

" FZF
" ============================================================
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" fzf settings
" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'


nnoremap <leader>fl :Lines 
nnoremap <leader>fb :BLines 
"nnoremap <leader>ff :Files 
nnoremap <leader>ff :FZF
nnoremap <leader>fg :GFiles 
nnoremap <leader>f? :GFiles? 
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fa :Ag 
nnoremap <leader>fc :Commits
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'rounded'} }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root() 

" coc.nvim
" ======================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build'  }

let g:coc_global_extensions = ['coc-json','coc-tsserver','coc-emmet','coc-tslint','coc-prettier']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Easymotion
" ===========================================================
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1


" Code tools
" ============================================================
" Auto complete for quote marks
" Plug 'Raimondi/delimitMate'

" Auto complete for html/xml tags
Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

" Comment shortcuts
" Plug 'scrooloose/nerdcommenter'
" let g:NERDSpaceDelims=1

" Javascript
" ======================
Plug 'leafgarland/typescript-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"





" vim-slime
Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1

" auto formatter with ALE
"Plug 'Chiel92/vim-autoformat'
Plug 'dense-analysis/ale'
" Fix Python files with autopep8 and yapf.
let g:ale_fixers = {}
let g:ale_fixers.python = ['black']
" Disable warnings about trailing whitespace for Python files.
let g:ale_warn_about_trailing_whitespace = 0
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

Plug 'psf/black', { 'tag': '19.10b0' }
"Plug 'psf/black', { 'branch': 'stable' }

" -------------------  end of plug ---------------------------------
call plug#end()
