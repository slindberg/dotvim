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

" I just don't use macros... does that make me a bad person?
map q <nop>

" remove search highlight with double escape
map <silent> <esc><esc> :nohlsearch<cr>

" open help pages in a new tab
cnoreabbrev help tab help
cnoreabbrev h tab help

" use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> <c-w>k
nmap <silent> <c-j> <c-w>j
nmap <silent> <c-h> <c-w>h
nmap <silent> <c-l> <c-w>l
nmap <silent> <c-c> <c-w>c

" move lines in visual mode and re-indent
vnoremap J :m'>+1<cr>gv=gv
vnoremap K :m'<-2<cr>gv=gv

" re-indent pasted text
nnoremap p p=`]
nnoremap P P=`]
vnoremap p p=`]
vnoremap P P=`]

" shortcut to switch to last used buffer
nnoremap <leader>l :e#<cr>

" shortcut for jumping to the next/previous error in the error list
nnoremap <leader>] :lnext<cr>
nnoremap <leader>[ :lprev<cr>

" center on what we are looking for
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz

" insert a blank line below the current line without entering insert mode
nnoremap <c-n> m`o<esc>``

" insert a semicolon at the end of the line
nnoremap <leader>; m`A;<esc>``

" toggle paste mode
nnoremap <silent> <leader>p :set invpaste<cr>

" reload vimrc
nnoremap <leader>rr :source $MYVIMRC<cr>

" Search for visually selected text, forwards or backwards.
vnoremap <silent> * :<c-u>
  \let tmp_reg=getreg('"')<bar>let tmp_regtype=getregtype('"')<cr>
  \gvy/<c-r><c-r>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
  \gV:call setreg('"', tmp_reg, tmp_regtype)<cr>
vnoremap <silent> # :<c-u>
  \let tmp_reg=getreg('"')<bar>let tmp_regtype=getregtype('"')<cr>
  \gvy?<c-r><c-r>=substitute(escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
  \gV:call setreg('"', tmp_reg, tmp_regtype)<cr>
