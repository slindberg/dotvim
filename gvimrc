" set font and size
set guifont=Menlo:h15

" Smyck colorscheme looks better in vim GUI
colorscheme smyck

" automatically reload a file if it has changed outside of vim
set autoread

" disable audible bell, visual bell doesn't work in MacVim
set visualbell

" save files when focus is lost
autocmd FocusLost * :wa | doautocmd BufWritePre

" use cmd+shift+arrows for tab navigation like terminal
noremap <silent> <d-s-right> :tabnext<cr>
noremap <silent> <d-s-left> :tabprev<cr>
