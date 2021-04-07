" Fold code
nnoremap <space> za
vnoremap <space> zf

" Paste toggle 
set pastetoggle=<leader>p


" Source hot key
nnoremap <f5> :source % <CR>

" Startify
map <silent><leader>a :Startify  <CR>

" Tab nav
"nnoremap <silent> H :tabprevious<CR>                                                                            
"nnoremap <silent> K :tabnextCR><CR>                                                                            
nnoremap <silent>J :tabprevious <CR>
nnoremap <silent>K :tabnext <CR>
"nnoremap <silent>N :tabnew <CR>
"nnoremap <C-j :tabprevious>CR><                                                                            
"nnoremap <C-k :tabnext<>CR>

" Buffer
nnoremap <silent><C-b> :Buffers <CR>



" FZF mapping
nnoremap <silent><leader>fl :Lines 
nnoremap <silent><leader>fb :BLines 
nnoremap <silent><leader>ff :FZF <CR>
nnoremap <silent><leader>fg :GFiles 
nnoremap <silent><leader>f? :GFiles? 
nnoremap <silent><leader>ft :Tags<cr>
nnoremap <silent><leader>fa :Ag 
nnoremap <silent><leader>fc :Commits


" defx mapping
map <silent> - :Defx<CR>
"nnoremap <silent> - :Defx -split=vertical -winwidth=35 -direction=topleft -columns=icons:filename:type<cr>

autocmd FileType defx call s:defx_mapping()

" Keymap in defx
function! s:defx_mapping() abort
  " IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)

  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')

endfunction

" auto pair
"imap <C-b>e <M-e>



" Testing run select python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>



nnoremap <A-S-F> :Autoformat<CR>
