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


" lightline
" ================================================
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'  ] ]
      \ },
      \ 'component': {
      \ },
      \ }
" indentLine
" ================================================
Plug 'Yggdroot/indentLine'

" surrond.vim
" ================================================
Plug 'tpope/vim-surround' 


" Color Themes
" ================================================
Plug 'ParamagicDev/vim-medic_chalk'
let g:indentLine_color_term = 239



" ================================================
Plug 'google/vim-colorscheme-primary'


" vim-slime
Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1

" ale
Plug 'dense-analysis/ale'
" Check Python files with flake8 and pylint.
"let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
"let b:ale_fixers = ['autopep8', 'yapf']

" -------------------  end of plug ---------------------------------
call plug#end()
