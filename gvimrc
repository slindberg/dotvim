" set font and size
set guifont=Menlo:h15

" save files when focus is lost
autocmd FocusLost * :wa | doautocmd BufWritePre

" use cmd+shift+arrows for tab navigation like terminal
noremap <silent> <d-s-right> :tabnext<cr>
noremap <silent> <d-s-left> :tabprev<cr>
