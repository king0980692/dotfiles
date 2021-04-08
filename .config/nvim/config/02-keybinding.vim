" Save file
nmap  <C-s> <esc>:w<cr>
imap  <C-s> <esc>:w<cr>

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

nmap  <C-j> :ALENext<cr>
nmap  <C-k> :ALEPrevious<cr>
nmap  <C-i> :ALEGoToDefinition<cr>
nmap  <C-I> :ALEFindReference<cr>
