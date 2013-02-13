" change the leader key to the much quicker-to-type comma
let mapleader=","

" get rid of annoying shift key blunders
com! W w
com! Wq wq
com! Q q

" write a file you opened without correct permissions
com! WW :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Ex mode is dumb
map Q <nop>

" remove search highlight with double escape
map <silent> <esc><esc> :nohlsearch<cr>

" use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> <c-w>k
nmap <silent> <c-j> <c-w>j
nmap <silent> <c-h> <c-w>h
nmap <silent> <c-l> <c-w>l
nmap <silent> <c-c> <c-w>c

" shortcut to switch to last used buffer
nnoremap <leader>l :e#<cr>

" center on what we are looking for
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz

" insert a blank line below the current line without entering insert mode
nnoremap <c-o> m`o<esc>``

" toggle paste mode
nnoremap <silent> <leader>p :set invpaste<CR>

" reload vimrc
nnoremap <leader>rr :source $MYVIMRC<cr>
